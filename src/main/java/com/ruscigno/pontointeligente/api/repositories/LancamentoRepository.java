package com.ruscigno.pontointeligente.api.repositories;

import java.util.List;

import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.ruscigno.pontointeligente.api.entities.Lancamento;

@Transactional(readOnly=true)
@NamedQueries({
	@NamedQuery(name="LancamentoRepository.findByFuncionarioId", 
				query="select lanc from Lancamento lanc where lanc.funcionario.id = :funcionarioId")})
public interface LancamentoRepository extends JpaRepository<Lancamento, Long>{
	
	List<Lancamento> findByFuncionarioId(@Param("funcionarioId") Long funcionario);
	
	Page<Lancamento> findByFuncionarioId(@Param("functionarioId") Long functionarioId, Pageable pageable);

}
