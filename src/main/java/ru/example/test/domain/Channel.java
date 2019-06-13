package ru.example.test.domain;

import javax.persistence.*;

@Entity
public class Channel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String chnUrl;

    private String name;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    public User author;

    public Channel() {
    }

    public Channel(String chnUrl, String name, User user) {
        this.author = user;
        this.chnUrl = chnUrl;
        this.name = name;
    }


    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public String getChnUrl() {
        return chnUrl;
    }

    public void setChnUrl(String chnUrl) {
        this.chnUrl = chnUrl;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }
}
