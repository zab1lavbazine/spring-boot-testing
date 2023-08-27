package com.example.demo;


import jakarta.annotation.security.PermitAll;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;

//    public ProductController(ProductController productController){
//        this.productController = productController;
//    } can define that way or use required args constructor

    @GetMapping("/")
    public String products (@RequestParam(name = "title", required = false) String title, Principal principal , Model model){
        model.addAttribute("products", productService.getAllProducts(title));
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "products";
    }

    @PostMapping("/product/create")
    public String createProduct(Product product,
                                @RequestParam("file1") MultipartFile file1,
                                @RequestParam("file2") MultipartFile file2,
                                @RequestParam("file3") MultipartFile file3,
                                Principal principal)
                                throws IOException {
        productService.saveProducts( principal,product, file1, file2, file3);
        return "redirect:/";
    }
    @PostMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable UUID id ){
        productService.removeProduct(id);
        return "redirect:/";
    }
    @GetMapping("/product/{id}")
    public String productInfo(@PathVariable  UUID id, Model model){
//        model.addAttribute("product", productService.getProductById(id));
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("images", product.getImages());
        return "product-info";
    }
}
