package com.spacecodee.salessysbackend.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@ToString
@Entity
@Table(name = "sale")
public class SaleEntity {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "sale_id", nullable = false)
    private Long saleId;
    @OneToMany(targetEntity = CustomerEntity.class, cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinColumn(name = "customer_dni", referencedColumnName = "sale_customer_dni")
    private List<CustomerEntity> saleCustomerDni;
    @OneToMany(targetEntity = ProductEntity.class, cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id", referencedColumnName = "sale_product_id")
    private List<ProductEntity> saleProductId;
}
