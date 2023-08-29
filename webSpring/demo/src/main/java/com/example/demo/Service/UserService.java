package com.example.demo.Service;


import com.example.demo.Repository.UserRepository;
import com.example.demo.Entity.RolesEnum;
import com.example.demo.Entity.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
@Slf4j // logging for all actions
@RequiredArgsConstructor // lombok library for automatic generation for all variables in class
public class UserService {
    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public boolean createUser( User newUser){
        String email = newUser.getEmail();
        if (userRepository.findByEmail(email) != null) return false;
        newUser.setActive(true);
        newUser.setPassword(passwordEncoder.encode(newUser.getPassword()));
        newUser.getRoles().add(RolesEnum.ROLE_USER);
        log.info("Saving new User with email : {}", email);
        userRepository.save(newUser);
        return true;
    }

    public List<User> getAllUsers(){
        return userRepository.findAll();
    }

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public void banUser(UUID id) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null){
            if (user.isActive()){
                user.setActive(false);
                log.info("Ban user with id: {}, email: {}", user.getId(), user.getEmail());
            } else {
                user.setActive(true);
                log.info("Unban user with id: {}, email: {}", user.getId(), user.getEmail());
            }
            userRepository.save(user);
        }
    }

    public void changeUserRoles(User user, Map<String, String> form) {
        Set<String> roles = Arrays.stream(RolesEnum.values())
                .map(RolesEnum::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for(String key : form.keySet()){
            if (roles.contains(key)){
                user.getRoles().add(RolesEnum.valueOf(key));
            }
        }
        userRepository.save(user);
    }
}
