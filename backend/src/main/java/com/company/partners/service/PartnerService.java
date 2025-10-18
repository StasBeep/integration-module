package com.company.partners.service;

import com.company.partners.model.Partner;
import com.company.partners.repository.PartnerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PartnerService {

    @Autowired
    private PartnerRepository partnerRepository;

    // Получить всех партнеров
    public List<Partner> getAllPartners() {
        return partnerRepository.findAll();
    }

    // Получить партнера по ID
    public Partner getPartnerById(Long id) {
        return partnerRepository.findById(id).orElse(null);
    }

    // Создать нового партнера
    public Partner createPartner(Partner partner) {
        return partnerRepository.save(partner);
    }

    // Обновить партнера
    public Partner updatePartner(Long id, Partner partnerDetails) {
        Partner partner = partnerRepository.findById(id).orElse(null);
        if (partner != null) {
            partner.setName(partnerDetails.getName());
            partner.setEmail(partnerDetails.getEmail());
            partner.setPhone(partnerDetails.getPhone());
            partner.setTotalSales(partnerDetails.getTotalSales());
            return partnerRepository.save(partner);
        }
        return null;
    }

    // Удалить партнера
    public void deletePartner(Long id) {
        partnerRepository.deleteById(id);
    }

    // Рассчитать скидку для партнера
    public Double calculateDiscount(Long partnerId) {
        Partner partner = partnerRepository.findById(partnerId).orElse(null);
        if (partner != null) {
            Double totalSales = partner.getTotalSales();
            if (totalSales > 300000)
                return 0.15;
            else if (totalSales > 50000)
                return 0.10;
            else if (totalSales > 10000)
                return 0.05;
            else
                return 0.0;
        }
        return 0.0;
    }
}