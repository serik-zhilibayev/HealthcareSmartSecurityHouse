package com.example.idea.Repo;

import com.example.idea.Entity.Relative;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface RelativeRepository extends CrudRepository<Relative, Long> {
    List<Relative> findByName(String name);
}
