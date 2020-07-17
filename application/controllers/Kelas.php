<?php

if (!defined('BASEPATH'))
  exit('No direct script access allowed');

class Kelas extends CI_Controller {

  function __construct() {
    parent::__construct();
    is_login();
    $this->load->model('Kelas_model');
    $this->load->library('form_validation');
    $this->load->library('Pagination');
    $this->load->library('Pagination_bs');
  }

  public function index() {
    //$mhs = $this->Mhs_model->get_all();
    if ($this->input->POST('s_cari',TRUE)) {
      $this->session->set_flashdata('pag', $this->input->POST('cari',TRUE));
    }
    elseif ($this->input->POST('reset')) {
      $this->session->set_flashdata('pag', '');
    }

    $jlh_data = $this->Kelas_model->count_data($this->session->flashdata('pag'));
    $config = $this->pagination_bs->load('kelas/index',$jlh_data);
    $this->pagination->initialize($config);
    $page = ($this->uri->segment(3)) ? $this->uri->segment(3) : 0;

    //panggil function get_mahasiswa_list yang ada pada mmodel mahasiswa_model.
    $kelas_data = $this->Kelas_model->get_kelas_list($config["per_page"], $page,$this->session->flashdata('pag'));

    // sesion untuk cari
    $this->session->set_flashdata('pag', $this->session->flashdata('pag'));

    //echo $this->input->post('cari',TRUE);;
    //echo $this->session->flashdata('pag');
    $pagination = $this->pagination->create_links();
    $data = array(
      'page' => $page,
      'kelas_data' => $kelas_data,
      'pagination' => $pagination,
      'jlh_data' => $jlh_data,
    );
    $this->template->load('template_tabel','menu','kelas/kelas_list', $data);
    //$this->load->view('menu','',FALSE);//true false untuk tidak langsung tampil
  }

  public function read($id) {
    $row = $this->Kelas_model->get_by_id($id);
    if ($row) {
      $data = array(
        'judul' => 'Detail Kelas',
    		'idkelas' => $row->idkelas,
    		'kelas' => $row->kelas,
        'namaguru' => $row->namaguru,
      );
      $this->template->load('template_tabel','menu','kelas/kelas_read', $data);
    }
    else {
      $this->session->set_flashdata('message', 'Record Not Found');
      redirect(site_url('kelas'));
    }
  }

  public function create() {
    $query = $this->Kelas_model->get_guru();
    $data = array(
      'judul' => 'Tambah Kelas',
      'button' => 'Simpan',
      'action' => site_url('kelas/create_action'),
      'idkelas' => set_value('idkelas'),
      'kelas' => set_value('kelas'),
      'idguru' => set_value('idguru'),
      "namaguru" => $query,
    );
    $this->template->load('template_form','menu','kelas/kelas_form', $data);
  }

  public function create_action() {
    $this->_rules();

    if ($this->form_validation->run() == FALSE) {
      $this->create();
    }
    else {
      //$foto=$this->upload_foto_mhs();
      $data = array(
        'idkelas' => $this->input->post('idkelas',TRUE),
        'kelas' => $this->input->post('kelas',TRUE),
        'idguru' => $this->input->post('idguru',TRUE),
      );
      $this->Kelas_model->insert($data);
      $this->session->set_flashdata('message', 'Nama Kelas '.$this->input->post('kelas',TRUE).' berhasil ditambah');
      redirect(site_url('kelas/create'));
    }
  }

  public function update($id) {
    $row = $this->Kelas_model->get_by_id($id);
    $query = $this->Kelas_model->get_guru();
    //echo $row['nim'];
    if ($row) {
      $data = array(
        'judul' => 'Edit Kelas',
        'button' => 'Ubah',
        'action' => site_url('kelas/update_action'),
        'idkelas' => set_value('idkelas', $row->idkelas),
        'kelas' => set_value('kelas',$row->kelas),
        'idguru' => set_value('idguru',$row->idguru),
        "namaguru" => $query,
      );
      $this->template->load('template_form','menu','kelas/kelas_form', $data);
    }
    else {
      $this->session->set_flashdata('message', 'Record Not Found');
      redirect(site_url('kelas'));
    }
  }

  public function update_action() {
    $this->_rules_update();

    if ($this->form_validation->run() == FALSE) {
      $this->update($this->input->post('idkelas', TRUE));
    }
    else {
      $data = array(
        'kelas' => $this->input->post('kelas',TRUE),
        'idguru' => $this->input->post('idguru',TRUE),
      );
      $this->Kelas_model->update($this->input->post('idkelas', TRUE), $data);
      $this->session->set_flashdata('message', 'Update Record Success');
      //redirect(site_url('tahunajaran/update/'.$this->input->post('idtahunajaran',TRUE)));
      redirect(site_url('kelas'));
    }
  }

  public function delete($id) {
    $row = $this->Kelas_model->get_by_id($id);
    if ($row) {
      $this->Kelas_model->delete($id);
      $this->session->set_flashdata('message', 'Delete Record Success');
      redirect(site_url('kelas'));
    }
    else {
      $this->session->set_flashdata('message', 'Record Not Found');
      redirect(site_url('kelas'));
    }
  }

  public function _rules() {
  	//$this->form_validation->set_rules('idkelas', 'ID Kelas', 'trim|required|is_unique[t002_kelas.idkelas]');
  	$this->form_validation->set_rules('kelas', 'Nama Kelas', 'trim|required');
    $this->form_validation->set_rules('idguru', 'Nama Guru', 'trim|required');
  	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
  }

  public function _rules_update() {
    //$this->form_validation->set_rules('idkelas', 'ID Kelas', 'trim|required');
    $this->form_validation->set_rules('kelas', 'Nama Kelas', 'trim|required');
    $this->form_validation->set_rules('idguru', 'Nama Guru', 'trim|required');
    $this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
  }

  public function excel() {
    $this->load->helper('exportexcel');
    $namaFile = "Data Mahasiswa.xls";
    $judul = "Data Mahasiswa";
    $tablehead = 0;
    $tablebody = 1;
    $nourut = 1;
    //penulisan header
    header("Pragma: public");
    header("Expires: 0");
    header("Cache-Control: must-revalidate, post-check=0,pre-check=0");
    header("Content-Type: application/force-download");
    header("Content-Type: application/octet-stream");
    header("Content-Type: application/download");
    header("Content-Disposition: attachment;filename=" . $namaFile . "");
    header("Content-Transfer-Encoding: binary ");

    xlsBOF();

    $kolomhead = 0;
    xlsWriteLabel($tablehead, $kolomhead++, "No");
    xlsWriteLabel($tablehead, $kolomhead++, "Nim");
    xlsWriteLabel($tablehead, $kolomhead++, "Nama");
    xlsWriteLabel($tablehead, $kolomhead++, "Gender");
    xlsWriteLabel($tablehead, $kolomhead++, "Tempat Lahir");
    xlsWriteLabel($tablehead, $kolomhead++, "Tanggal Lahir");

    foreach ($this->Mhs_model->get_all() as $data) {
    $kolombody = 0;

    //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
    xlsWriteNumber($tablebody, $kolombody++, $nourut);
    xlsWriteLabel($tablebody, $kolombody++, $data->nim);
    xlsWriteLabel($tablebody, $kolombody++, $data->nama);
    xlsWriteLabel($tablebody, $kolombody++, $data->gender);
    xlsWriteNumber($tablebody, $kolombody++, $data->tempat_lahir);
    xlsWriteNumber($tablebody, $kolombody++, $data->tanggal_lahir);

    $tablebody++;
    $nourut++;
    }

    xlsEOF();
    exit();
  }

  public function word() {
    header("Content-type: application/vnd.ms-word");
    header("Content-Disposition: attachment;Filename=menu.doc");
    $data = array(
      'menu_data' => $this->Mhs_model->get_all(),
      'start' => 0
    );
    $this->load->view('menu_doc',$data);
  }

  function pdf() {
    $data = array(
      'menu_data' => $this->Menu_model->get_all(),
      'start' => 0
    );
    ini_set('memory_limit', '32M');
    $html = $this->load->view('menu_pdf', $data, true);
    $this->load->library('pdf');
    $pdf = $this->pdf->load();
    $pdf->WriteHTML($html);
    $pdf->Output('menu.pdf', 'D');
  }

}
