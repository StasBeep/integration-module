package com.company.partners.controller;

import com.company.partners.model.Partner;
import com.company.partners.service.PartnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/partners")
public class PartnerController {

    @Autowired
    private PartnerService partnerService;

    // Получить всех партнеров
    @GetMapping
    public List<Partner> getAllPartners() {
        return partnerService.getAllPartners();
    }

    // Получить партнера по ID
    @GetMapping("/{id}")
    public ResponseEntity<Partner> getPartnerById(@PathVariable Long id) {
        Partner partner = partnerService.getPartnerById(id);
        if (partner != null) {
            return ResponseEntity.ok(partner);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // Создать нового партнера
    @PostMapping
    public Partner createPartner(@RequestBody Partner partner) {
        return partnerService.createPartner(partner);
    }

    // Обновить партнера
    @PutMapping("/{id}")
    public ResponseEntity<Partner> updatePartner(@PathVariable Long id, @RequestBody Partner partnerDetails) {
        Partner updatedPartner = partnerService.updatePartner(id, partnerDetails);
        if (updatedPartner != null) {
            return ResponseEntity.ok(updatedPartner);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // Удалить партнера
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletePartner(@PathVariable Long id) {
        Partner partner = partnerService.getPartnerById(id);
        if (partner != null) {
            partnerService.deletePartner(id);
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // Рассчитать скидку для партнера
    @GetMapping("/{id}/discount")
    public ResponseEntity<Double> calculateDiscount(@PathVariable Long id) {
        Double discount = partnerService.calculateDiscount(id);
        return ResponseEntity.ok(discount);
    }

    // Тестовые endpoints
    @GetMapping("/test")
    public String test() {
        return "Partner API is working!";
    }

    @GetMapping("/health")
    public String health() {
        return "Partner controller is healthy!";
    }
}