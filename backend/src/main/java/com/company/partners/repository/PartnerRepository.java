package com.company.partners.repository;

import com.company.partners.model.Partner;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PartnerRepository extends JpaRepository<Partner, Long> {
    // Дополнительные методы можно добавить здесь
}