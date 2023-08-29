package com.example.demo.Service;

import com.example.demo.Entity.Image;
import com.example.demo.Entity.Product;
import com.example.demo.Repository.ProductRepository;
import com.example.demo.Repository.UserRepository;
import com.example.demo.Entity.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor // for creating an object (product)
@Slf4j // logs
public class ProductService {
    private final ProductRepository productRepository;

    private final UserRepository userRepository;


    public List<Product> getAllProducts(String title) {
        if (title != null) return productRepository.findByTitle(title);
        return productRepository.findAll();
    }
    public void saveProducts(Principal principal, Product newProduct, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        newProduct.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        Image image3;

        log.info("Saving new Product.Title: {}; Author : {}", newProduct.getTitle(), newProduct.getUser().getEmail());
        Product productFromDB = productRepository.save(newProduct);

        if (file1.getSize() != 0){
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            newProduct.addImageToProduct(image1);
            productFromDB.setPreviewImageId(productFromDB.getImages().get(0).getId());
        }
        if (file2.getSize() != 0){
            image2 = toImageEntity(file2);
            newProduct.addImageToProduct(image2);
        }
        if (file3.getSize() != 0){
            image3 = toImageEntity(file3);
            newProduct.addImageToProduct(image3);
        }


        productRepository.save(newProduct);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException{
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }




    public void removeProduct(UUID id){
        productRepository.deleteById(id);

    }

    public Product getProductById(UUID id) {
        return productRepository.findById(id).orElse(null);
    }
}
