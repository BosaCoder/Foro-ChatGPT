package com.example.forum.model;

import jakarta.persistence.*;

@Entity
@Table(name = "POSTS")
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "POST_SEQ_GEN")
    @SequenceGenerator(sequenceName = "SEQ_POSTS", allocationSize = 1, name = "POST_SEQ_GEN")
    @Column(name = "ID")
    private Long id_posts;

    @Column(name = "TITLE", nullable = false)
    private String title;

    @Column(name = "CONTENT", nullable = false)
    private String content;

    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    @JoinColumn(name = "USER_ID", referencedColumnName = "ID")
    private User user;

    public Long getId_posts() {
        return id_posts;
    }

    public void setId_posts(Long id_posts) {
        this.id_posts = id_posts;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}

