package com.lbg.retail.audit;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AuditApiController {
	
	@PostMapping("/audit/v1/entries")
	public String createAuditEntry(@RequestBody AuditEntry entry) {
		System.out.println("Audit entry received.");
		return "Audit entry received.";
	}
	
	@GetMapping("/audit/v1/health")
	public String getAuditEntry() {
		System.out.println("Health call received.");
		return "OK";
	}

}
