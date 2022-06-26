package com.spacecodee.salessysbackend.entity;

import lombok.*;

import javax.persistence.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "supplier")
public class SupplierEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "supplier_dni")
    private String supplierDni;
    @Basic
    @Column(name = "supplier_name")
    private String supplierName;
    @Basic
    @Column(name = "supplier_lastname")
    private String supplierLastname;
    @Basic
    @Column(name = "supplier_phone_number")
    private String supplierPhoneNumber;
}
