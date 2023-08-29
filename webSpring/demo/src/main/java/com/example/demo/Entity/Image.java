package com.example.demo.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Entity
@Table(name="images")

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO) // will use as key
    @Column(name="id")
    private UUID id;
    @Column (name="name")
    private String name;
    @Column (name="originalFileName")
    private String originalFileName;
    @Column (name="size")
    private Long size;
    @Column (name="contentType")
    private String contentType;
    @Column (name="isPreviewImage")
    private boolean isPreviewImage;
    @Lob // will save as a long block
    @Column (name="bytes", columnDefinition = "longblob")
    private byte [] bytes;

    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    // cascade : on delete will be deleated all photos and on save will be saved all photos
    // fetch : the way downloading
    private Product product;
}
