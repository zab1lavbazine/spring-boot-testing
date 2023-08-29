package com.example.demo.Repository;

import com.example.demo.Entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

// all actions with the database for getting all products for ex. and so on
public interface ProductRepository extends JpaRepository<Product, UUID> {
    List<Product> findByTitle (String title);

}
