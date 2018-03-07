<?php
class Autorizacao {
  
  public function obterAutorizacao()
  {

    if ( ! class_exists('CI_Session', FALSE)) 
    {
        return;
    }

     $CI =& get_instance();
     $CI->load->library('session');
     $id_usuario = $CI->session->userdata('id_usuario');

     if(is_null($id_usuario)){
        //redirect('http://www.google.com','refresh');
     }
  }
}