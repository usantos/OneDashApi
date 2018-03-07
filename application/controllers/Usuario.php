<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Usuario extends CI_Controller {

	public function do_authentication()
	{	
		$data = array(
        	'usuario' => $this->input->post('usuario'),
        	'senha'   => $this->input->post('senha')
		);

		$usuario = $this->usuario_model->do_authentication($data);

		if($usuario != null){

			$dados_sessao = array(
	        	'id_usuario'     => $usuario->id,
	        	'nome_usuario'   => $usuario->nome,
	        	'usuario_logado' => TRUE,
	        	'data_acesso'    => time()
			);

			$this->session->set_userdata($dados_sessao);

			var_dump($usuario);

		}else{
			echo "Usuário não encontrado!";
		}
	}

	public function update_entry()
	{
		$data = array(
			'id'    => $this->uri->segment(3),
	        'nome'  => $this->input->post('nome')
		);

		if($this->usuario_model->get_by_id($data) != 0)
		{
			$usuario = $this->usuario_model->update_entry($data);
		}else{
			echo "Usuário não existe";
		}
	}

	public function insert_entry()
	{
		$data = array(
	        'nome'    => "Teste",
	        'usuario' => trim("teste"),
	        'senha'   => md5("teste"),
	        'ativo'   => "0",
	        'perfil'  => "VIP"
		);

		$usuario_existe = $this->usuario_model->get_by_login($data);
		if($usuario_existe == 0)
		{
			$usuario = $this->usuario_model->insert_entry($data);
		}else{
			echo "Usuário já cadastrado";
		}

		$this->output->enable_profiler(TRUE);
	}

	public function delete_entry()
	{
		$data = array(
	        'id' => $this->uri->segment(3),
		);

		if($this->usuario_model->get_by_id($data) != 0)
		{
			$usuario = $this->usuario_model->delete_entry($data);
			$this->output->enable_profiler(TRUE);
		}else{
			echo "Usuário não existe";
		}
	}
}
