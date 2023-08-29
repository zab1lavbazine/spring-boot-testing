package com.example.demo.Entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


@Entity
@Table (name = "products")

@Data
@AllArgsConstructor
@NoArgsConstructor // geters and setters
public class Product {
    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    @Column (name = "id")
    private  UUID id;
    @Column (name = "title")
    private String title;
    @Column (name = "description", columnDefinition = "text") // description can be very long so we need unlimited string
    private String description;
    @Column (name = "price")
    private int price;
    @Column (name = "city")
    private String city;
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinColumn
    private User user;


    @OneToMany (cascade = CascadeType.ALL, fetch = FetchType.LAZY,
    mappedBy = "product")
    private List<Image> images = new ArrayList<>();
    private UUID previewImageId;
    private LocalDateTime dateOfCreated;

    @PrePersist
    // method of initialization
    private void init (){
        dateOfCreated = LocalDateTime.now();
    }

    public void addImageToProduct (Image image){
        image.setProduct(this);
        images.add(image);
    }

}
