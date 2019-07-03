package ru.example.test.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.example.test.domain.User;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);

    User findByActivate(String code);
}
