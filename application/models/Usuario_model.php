<?php

class Usuario_model extends CI_Model 
{
	public function get_last_ten_entries()
        {
                return $this->db->get('acesso', 10)->result();
        }

        public function get_by_login($data)
        {       
                $this->db->where('usuario', $data['usuario']);
                return $this->db->get('acesso')->num_rows();
        }

        public function get_by_id($data)
        {       $this->db->where('id', $data['id']);
                return $this->db->get('acesso')->num_rows();
        }

        public function insert_entry($data)
        {
                $this->db->insert('acesso', $data);
        }

        public function update_entry($data)
        {
                $this->db->where('id', $data['id']);
                $this->db->update('acesso', $data);
        }

        public function delete_entry($data)
        {
                $this->db->where('id', $data['id']);
        	$this->db->delete('acesso');
        }

        public function do_authentication($data)
        {
                return $this->db->select('id, nome')->get_where('acesso', $data)->row();
        }

        public function truncate_table()
        {
                $this->db->from('acesso');
                $this->db->truncate();
        }
}