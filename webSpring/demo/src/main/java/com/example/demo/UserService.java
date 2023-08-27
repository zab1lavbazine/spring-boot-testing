package com.example.demo;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

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

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }
}
