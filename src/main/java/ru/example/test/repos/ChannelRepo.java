package ru.example.test.repos;

import org.springframework.data.repository.CrudRepository;
import ru.example.test.domain.Channel;
import ru.example.test.domain.Message;

import java.util.List;

public interface ChannelRepo extends CrudRepository<Channel, Integer> {
    List<Channel> findByName(String name);
}
