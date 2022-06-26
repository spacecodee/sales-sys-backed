package com.spacecodee.salessysbackend.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;

@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "provide_product")
public class ProvideProductEntity {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "provide_id", nullable = false)
    private Long provideId;
    @OneToMany(targetEntity = ProductEntity.class, cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id", referencedColumnName = "provide_product_id")
    private List<ProductEntity> provideProductId;
    @OneToMany(targetEntity = SupplierEntity.class, cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinColumn(name = "supplier_dni", referencedColumnName = "provide_suplier_dni")
    private List<SupplierEntity> provideSuplierDni;
    @Column(name = "provide_product_date_in")
    private Date provideProductDateIn;
}
