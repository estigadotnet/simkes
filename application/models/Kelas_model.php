<?php

if (!defined('BASEPATH'))
  exit('No direct script access allowed');

class Kelas_model extends CI_Model {

  public $table = 't003_kelas';
  public $id = 'idkelas';
  public $order = 'ASC';

  function __construct() {
      parent::__construct();
  }

  function get_guru() {
    $guru = $this->db->query("select idguru, namaguru from t002_guru");
    return $guru;
  }

  // get all
  function get_all() {
    $this->db->order_by($this->id, $this->order);
    return $this->db->get($this->table)->result();
  }

  function count_data($cari) {
    if (!empty($cari)) {
      $this->db->like('idkelas', $cari);
      $this->db->or_like('kelas', $cari);
    }
    $query=$this->db->get($this->table);
    return $query->num_rows();
  }

  function get_kelas_list($limit, $start,$cari) {
    $this->db->like('idkelas', $cari);
    $this->db->or_like('kelas', $cari);
    $this->db->select("idkelas, kelas, namaguru");
    $this->db->from("t003_kelas");
    $this->db->join("t002_guru", "t003_kelas.idguru = t002_guru.idguru");
    $this->db->order_by($this->id, $this->order);
    //$query = $this->db->get($this->table, $limit, $start);
    $this->db->limit($limit, $start);
    $query = $this->db->get();
    return $query;
  }

  // get data by id
  function get_by_id($id) {
    $this->db->select("idkelas, kelas, namaguru, t002_guru.idguru");
    $this->db->from("t003_kelas");
    $this->db->join("t002_guru", "t003_kelas.idguru = t002_guru.idguru");
    $this->db->where($this->id, $id);
    return $this->db->get()->row();
  }

  // get total rows
  function total_rows($q = NULL) {
    $this->db->like('idkelas', $q);
    $this->db->or_like('kelas', $q);
    $this->db->or_like('idguru', $q);
    $this->db->from($this->table);
    return $this->db->count_all_results();
  }

  // get data with limit and search
  function get_limit_data($limit, $start = 0, $q = NULL) {
    $this->db->order_by($this->id, $this->order);
    $this->db->like('idkelas', $q);
    $this->db->or_like('kelas', $q);
    $this->db->or_like('idguru', $q);
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
