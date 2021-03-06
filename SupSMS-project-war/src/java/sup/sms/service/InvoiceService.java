/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sup.sms.service;

import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import sup.sms.entity.Invoice;
import sup.sms.entity.User;
import sup.sms.repository.InvoiceRepository;

/**
 *
 * @author laurent
 */
@Stateless
public class InvoiceService{

    @EJB
    InvoiceRepository invoiceRepository;

    /**
     * Check if a user has been paid a invoice for the current period
     * @param user
     * @return 
     */
    public boolean invoiceHasBeenPaid(User user) {
        List<Invoice> invoices = user.getInvoices();
        for (Invoice invoice : invoices) {
            if(invoice.getEndDate().after(new Date())){
                return true;
            }
        }
        return false;
    }

    /**
     * See repo
     * @param invoice
     * @return 
     */
    public Invoice save(Invoice invoice) {
        return invoiceRepository.save(invoice);
    }
    
}
