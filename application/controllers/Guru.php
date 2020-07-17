<?php

if (!defined('BASEPATH'))
  exit('No direct script access allowed');

class Guru extends CI_Controller {

  function __construct() {
    parent::__construct();
    is_login();
    $this->load->model('Guru_model');
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

    $jlh_data = $this->Guru_model->count_data($this->session->flashdata('pag'));
    $config = $this->pagination_bs->load('guru/index',$jlh_data);
    $this->pagination->initialize($config);
    $page = ($this->uri->segment(3)) ? $this->uri->segment(3) : 0;

    //panggil function get_mahasiswa_list yang ada pada mmodel mahasiswa_model.
    $guru_data = $this->Guru_model->get_guru_list($config["per_page"], $page,$this->session->flashdata('pag'));

    // sesion untuk cari
    $this->session->set_flashdata('pag', $this->session->flashdata('pag'));

    //echo $this->input->post('cari',TRUE);;
    //echo $this->session->flashdata('pag');
    $pagination = $this->pagination->create_links();
    $data = array(
      'page' => $page,
      'guru_data' => $guru_data,
      'pagination' => $pagination,
      'jlh_data' => $jlh_data,
    );
    $this->template->load('template_tabel','menu','guru/guru_list', $data);
    //$this->load->view('menu','',FALSE);//true false untuk tidak langsung tampil
  }

  public function read($id) {
    $row = $this->Guru_model->get_by_id($id);
    if ($row) {
      $data = array(
        'judul' => 'Detail Guru',
    		'idguru' => $row->idguru,
    		'namaguru' => $row->namaguru,
      );
      $this->template->load('template_tabel','menu','guru/guru_read', $data);
    }
    else {
      $this->session->set_flashdata('message', 'Record Not Found');
      redirect(site_url('guru'));
    }
  }

  public function create() {
    $data = array(
      'judul' => 'Tambah Guru',
      'button' => 'Simpan',
      'action' => site_url('guru/create_action'),
      'idguru' => set_value('idguru'),
      'namaguru' => set_value('namaguru'),
    );
    $this->template->load('template_form','menu','guru/guru_form', $data);
  }

  public function create_action() {
    $this->_rules();

    if ($this->form_validation->run() == FALSE) {
      $this->create();
    }
    else {
      //$foto=$this->upload_foto_mhs();
      $data = array(
        'idguru' => $this->input->post('idguru',TRUE),
        'namaguru' => $this->input->post('namaguru',TRUE),
      );
      $this->Guru_model->insert($data);
      $this->session->set_flashdata('message', 'Nama Guru '.$this->input->post('namaguru',TRUE).' berhasil ditambah');
      redirect(site_url('guru/create'));
    }
  }

  public function update($id) {
    $row = $this->Guru_model->get_by_id($id);
    //echo $row['nim'];
    if ($row) {
      $data = array(
        'judul' => 'Edit Guru',
        'button' => 'Ubah',
        'action' => site_url('guru/update_action'),
        'idguru' => set_value('idguru', $row->idguru),
        'namaguru' => set_value('namaguru',$row->namaguru),
      );
      $this->template->load('template_form','menu','guru/guru_form', $data);
    }
    else {
      $this->session->set_flashdata('message', 'Record Not Found');
      redirect(site_url('guru'));
    }
  }

  public function update_action() {
    $this->_rules_update();

    if ($this->form_validation->run() == FALSE) {
      $this->update($this->input->post('idguru', TRUE));
    }
    else {
      $data = array(
        'namaguru' => $this->input->post('namaguru',TRUE),
      );
      $this->Guru_model->update($this->input->post('idguru', TRUE), $data);
      $this->session->set_flashdata('message', 'Update Record Success');
      //redirect(site_url('tahunajaran/update/'.$this->input->post('idtahunajaran',TRUE)));
      redirect(site_url('guru'));
    }
  }

  public function delete($id) {
    $row = $this->Guru_model->get_by_id($id);
    if ($row) {
      $this->Guru_model->delete($id);
      $this->session->set_flashdata('message', 'Delete Record Success');
      redirect(site_url('guru'));
    }
    else {
      $this->session->set_flashdata('message', 'Record Not Found');
      redirect(site_url('guru'));
    }
  }

  public function _rules() {
  	//$this->form_validation->set_rules('idguru', 'ID Guru', 'trim|required|is_unique[t002_guru.idguru]');
  	$this->form_validation->set_rules('namaguru', 'Nama Guru', 'trim|required');
  	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
  }

  public function _rules_update() {
    $this->form_validation->set_rules('idguru', 'ID Guru', 'trim|required');
    $this->form_validation->set_rules('namaguru', 'Nama Guru', 'trim|required');
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
