<?php

if (!defined('BASEPATH'))
  exit('No direct script access allowed');

class Siswa extends CI_Controller {

  function __construct() {
    parent::__construct();
    is_login();
    $this->load->model('Siswa_model');
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

    $jlh_data = $this->Siswa_model->count_data($this->session->flashdata('pag'));
    $config = $this->pagination_bs->load('siswa/index',$jlh_data);
    $this->pagination->initialize($config);
    $page = ($this->uri->segment(3)) ? $this->uri->segment(3) : 0;

    //panggil function get_mahasiswa_list yang ada pada mmodel mahasiswa_model.
    $siswa_data = $this->Siswa_model->get_siswa_list($config["per_page"], $page,$this->session->flashdata('pag'));

    // sesion untuk cari
    $this->session->set_flashdata('pag', $this->session->flashdata('pag'));

    //echo $this->input->post('cari',TRUE);;
    //echo $this->session->flashdata('pag');
    $pagination = $this->pagination->create_links();
    $data = array(
      'page' => $page,
      'siswa_data' => $siswa_data,
      'pagination' => $pagination,
      'jlh_data' => $jlh_data,
    );
    $this->template->load('template_tabel','menu','siswa/siswa_list', $data);
    //$this->load->view('menu','',FALSE);//true false untuk tidak langsung tampil
  }

  public function read($id) {
    $row = $this->Siswa_model->get_by_id($id);
    if ($row) {
      $data = array(
        'judul' => 'Detail Siswa',
    		'idsiswa'      => $row->idsiswa,
        "nis"          => $row->nis,
    		'namasiswa'    => $row->namasiswa,
        "kelas"        => $row->kelas,
        "tahunajaran"  => $row->tahunajaran,
        "byrspp"       => $row->byrspp,
        "byrcatering"  => $row->byrcatering,
        "byrworksheet" => $row->byrworksheet,
      );
      $this->template->load('template_tabel','menu','siswa/siswa_read', $data);
    }
    else {
      $this->session->set_flashdata('message', 'Record Not Found');
      redirect(site_url('siswa'));
    }
  }

  public function create() {
    $query = $this->Siswa_model->get_kelas();
    $data = array(
      'judul'        => 'Tambah Siswa',
      'button'       => 'Simpan',
      'action'       => site_url('siswa/create_action'),
      'idsiswa'      => set_value('idsiswa'),
      "nis"          => set_value("nis"),
      'namasiswa'    => set_value('namasiswa'),
      "idkelas"      => set_value("idkelas"),
      "kelas"        => $query,
      "tahunajaran"  => set_value("tahunajaran"),
      "byrspp"       => set_value("byrspp"),
      "byrcatering"  => set_value("byrcatering"),
      "byrworksheet" => set_value("byrworksheet"),
    );
    $this->template->load('template_form','menu','siswa/siswa_form', $data);
  }

  public function create_action() {
    $this->_rules();

    if ($this->form_validation->run() == FALSE) {
      $this->create();
    }
    else {
      //$foto=$this->upload_foto_mhs();
      $data = array(
        'idsiswa'      => $this->input->post('idsiswa',TRUE),
        "nis"          => $this->input->post("nis",TRUE),
        'namasiswa'    => $this->input->post('namasiswa',TRUE),
        "idkelas"      => $this->input->post("nis",TRUE),
        "tahunajaran"  => $this->input->post("tahunajaran",TRUE),
        "byrspp"       => $this->input->post("byrspp",TRUE),
        "byrcatering"  => $this->input->post("byrcatering",TRUE),
        "byrworksheet" => $this->input->post("byrworksheet",TRUE),
      );
      $this->Siswa_model->insert($data);
      $this->session->set_flashdata('message', 'Nama Siswa '.$this->input->post('siswa',TRUE).' berhasil ditambah');
      redirect(site_url('siswa/create'));
    }
  }

  public function update($id) {
    $row = $this->Siswa_model->get_by_id($id);
    $query = $this->Siswa_model->get_kelas();
    //echo $row['nim'];
    if ($row) {
      $data = array(
        'judul'        => 'Edit Siswa',
        'button'       => 'Ubah',
        'action'       => site_url('siswa/update_action'),
        'idsiswa'      => set_value('idsiswa', $row->idsiswa),
        'nis'          => set_value('idsiswa', $row->nis),
        'namasiswa'    => set_value('siswa',$row->namasiswa),
        'idkelas'      => set_value('idsiswa', $row->idkelas),
        "kelas"        => $query,
        'tahunajaran'  => set_value('idsiswa', $row->tahunajaran),
        'byrspp'       => set_value('idsiswa', $row->byrspp),
        'byrcatering'  => set_value('idsiswa', $row->byrcatering),
        'byrworksheet' => set_value('idsiswa', $row->byrworksheet),
      );
      $this->template->load('template_form','menu','siswa/siswa_form', $data);
    }
    else {
      $this->session->set_flashdata('message', 'Record Not Found');
      redirect(site_url('siswa'));
    }
  }

  public function update_action() {
    $this->_rules_update();

    if ($this->form_validation->run() == FALSE) {
      $this->update($this->input->post('idsiswa', TRUE));
    }
    else {
      $data = array(
        'nis'          => $this->input->post('nis',TRUE),
        'namasiswa'    => $this->input->post('namasiswa',TRUE),
        'idkelas'      => $this->input->post('idkelas',TRUE),
        'tahunajaran'  => $this->input->post('tahunajaran',TRUE),
        'byrspp'       => $this->input->post('byrspp',TRUE),
        'byrcatering'  => $this->input->post('byrcatering',TRUE),
        'byrworksheet' => $this->input->post('byrworksheet',TRUE),
      );
      $this->Siswa_model->update($this->input->post('idsiswa', TRUE), $data);
      $this->session->set_flashdata('message', 'Update Record Success');
      //redirect(site_url('tahunajaran/update/'.$this->input->post('idtahunajaran',TRUE)));
      redirect(site_url('siswa'));
    }
  }

  public function delete($id) {
    $row = $this->Siswa_model->get_by_id($id);
    if ($row) {
      $this->Siswa_model->delete($id);
      $this->session->set_flashdata('message', 'Delete Record Success');
      redirect(site_url('siswa'));
    }
    else {
      $this->session->set_flashdata('message', 'Record Not Found');
      redirect(site_url('siswa'));
    }
  }

  public function _rules() {
  	//$this->form_validation->set_rules('idsiswa', 'ID Siswa', 'trim|required|is_unique[t002_siswa.idsiswa]');
    $this->form_validation->set_rules('nis', 'NIS', 'trim|required');
  	$this->form_validation->set_rules('namasiswa', 'Nama Siswa', 'trim|required');
    $this->form_validation->set_rules('idkelas', 'Kelas', 'trim|required');
    $this->form_validation->set_rules('tahunajaran', 'Tahun Ajaran', 'trim|required');
    $this->form_validation->set_rules('byrspp', 'SPP', 'trim|required');
    $this->form_validation->set_rules('byrcatering', 'Catering', 'trim|required');
    $this->form_validation->set_rules('byrworksheet', 'Worksheet', 'trim|required');
  	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
  }

  public function _rules_update() {
    //$this->form_validation->set_rules('idsiswa', 'ID Siswa', 'trim|required');
    $this->form_validation->set_rules('nis', 'NIS', 'trim|required');
  	$this->form_validation->set_rules('namasiswa', 'Nama Siswa', 'trim|required');
    $this->form_validation->set_rules('idkelas', 'Kelas', 'trim|required');
    $this->form_validation->set_rules('tahunajaran', 'Tahun Ajaran', 'trim|required');
    $this->form_validation->set_rules('byrspp', 'SPP', 'trim|required');
    $this->form_validation->set_rules('byrcatering', 'Catering', 'trim|required');
    $this->form_validation->set_rules('byrworksheet', 'Worksheet', 'trim|required');
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
