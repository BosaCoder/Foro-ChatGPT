package com.example.forum.controller;

import com.example.forum.model.Post;
import com.example.forum.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/api/posts")
public class PostController {

    @Autowired
    private PostService postService;

    @GetMapping("/allposts")
    public List<Post> getAllPosts() {
        return postService.getAllPosts();
    }

    @PostMapping("/saveposts")
    public Post savePost(@RequestBody Post post) throws IOException, InterruptedException {
        Post savedPost = postService.savePost(post);

        postService.createGpt3Response(savedPost);

        return savedPost;
    }
}
