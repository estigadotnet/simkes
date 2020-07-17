<?php

if (!defined('BASEPATH'))
  exit('No direct script access allowed');

class Siswa_model extends CI_Model {

  public $table = 't004_siswa';
  public $id = 'idsiswa';
  public $order = 'ASC';

  function __construct() {
      parent::__construct();
  }

  function get_kelas() {
    $kelas = $this->db->query("select idkelas, kelas from t003_kelas");
    return $kelas;
  }

  // get all
  function get_all() {
    $this->db->order_by($this->id, $this->order);
    return $this->db->get($this->table)->result();
  }

  function count_data($cari) {
    if (!empty($cari)) {
      $this->db->like('idsiswa', $cari);
      $this->db->or_like('namasiswa', $cari);
    }
    $query=$this->db->get($this->table);
    return $query->num_rows();
  }

  function get_siswa_list($limit, $start,$cari) {
    $this->db->like('idsiswa', $cari);
    $this->db->or_like('namasiswa', $cari);
    $this->db->select("idsiswa, nis, namasiswa, t004_siswa.idkelas, kelas, tahunajaran, byrspp, byrcatering, byrworksheet");
    $this->db->from("t004_siswa");
    $this->db->join("t003_kelas", "t004_siswa.idkelas = t003_kelas.idkelas");
    $this->db->order_by($this->id, $this->order);
    //$query = $this->db->get($this->table, $limit, $start);
    $this->db->limit($limit, $start);
    $query = $this->db->get();
    return $query;
  }

  // get data by id
  function get_by_id($id) {
    $this->db->select("idsiswa, nis, namasiswa, kelas, tahunajaran, byrspp, byrcatering, byrworksheet, t003_kelas.idkelas");
    $this->db->from("t004_siswa");
    $this->db->join("t003_kelas", "t004_siswa.idkelas = t003_kelas.idkelas");
    $this->db->where($this->id, $id);
    return $this->db->get()->row();
  }

  // get total rows
  function total_rows($q = NULL) {
    $this->db->like('idsiswa', $q);
    $this->db->or_like('nis', $q);
    $this->db->or_like('namasiswa', $q);
    $this->db->or_like('idkelas', $q);
    $this->db->or_like('tahunajaran', $q);
    $this->db->or_like('byrspp', $q);
    $this->db->or_like('byrcatering', $q);
    $this->db->or_like('byrworksheet', $q);
    $this->db->from($this->table);
    return $this->db->count_all_results();
  }

  // get data with limit and search
  function get_limit_data($limit, $start = 0, $q = NULL) {
    $this->db->order_by($this->id, $this->order);
    $this->db->like('idsiswa', $q);
    $this->db->or_like('nis', $q);
    $this->db->or_like('namasiswa', $q);
    $this->db->or_like('idkelas', $q);
    $this->db->or_like('tahunajaran', $q);
    $this->db->or_like('byrspp', $q);
    $this->db->or_like('byrcatering', $q);
    $this->db->or_like('byrworksheet', $q);
    $this->db->limit($limit, $start);
    return $this->db->get($this->table)->result();
  }

  // insert data
  function insert($data) {
    $this->db->insert($this->table, $data);
  }

  // update data
  function update($id, $data) {
    $this->db->where($this->id, $id);
    $this->db->update($this->table, $data);
  }

  // delete data
  function delete($id) {
    $this->db->where($this->id, $id);
    $this->db->delete($this->table);
  }

}
