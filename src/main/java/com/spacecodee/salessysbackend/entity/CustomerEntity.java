package com.spacecodee.salessysbackend.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.sql.Date;

@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "customer")
public class CustomerEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "customer_dni", nullable = false, length = 8)
    private String customerDni;
    @Column(name = "customer_name")
    private String customerName;
    @Basic
    @Column(name = "customer_lastname")
    private String customerLastname;
    @Basic
    @Column(name = "customer_number_phone")
    private byte customerNumberPhone;
    @Basic
    @Column(name = "customer_birth_date")
    private Date customerBirthDate;
}
