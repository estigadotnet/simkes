<?php

if (!defined('BASEPATH'))
  exit('No direct script access allowed');

class Guru_model extends CI_Model {

  public $table = 't002_guru';
  public $id = 'idguru';
  public $order = 'ASC';

  function __construct() {
      parent::__construct();
  }

  // get all
  function get_all() {
    $this->db->order_by($this->id, $this->order);
    return $this->db->get($this->table)->result();
  }

  function count_data($cari) {
    if (!empty($cari)) {
      $this->db->like('idguru', $cari);
      $this->db->or_like('namaguru', $cari);
    }
    $query=$this->db->get($this->table);
    return $query->num_rows();
  }

  function get_guru_list($limit, $start,$cari) {
    $this->db->like('idguru', $cari);
    $this->db->or_like('namaguru', $cari);
    $this->db->order_by($this->id, $this->order);
    $query = $this->db->get($this->table, $limit, $start);
    return $query;
  }

  // get data by id
  function get_by_id($id) {
    $this->db->where($this->id, $id);
    return $this->db->get($this->table)->row();
  }

  // get total rows
  function total_rows($q = NULL) {
    $this->db->like('idguru', $q);
    $this->db->or_like('namaguru', $q);
    $this->db->from($this->table);
    return $this->db->count_all_results();
  }

  // get data with limit and search
  function get_limit_data($limit, $start = 0, $q = NULL) {
    $this->db->order_by($this->id, $this->order);
    $this->db->like('idguru', $q);
    $this->db->or_like('namaguru', $q);
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
