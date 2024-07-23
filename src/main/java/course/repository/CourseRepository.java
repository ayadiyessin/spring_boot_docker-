package course.repository;

import course.entity.Course;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CourseRepository extends CrudRepository<Course, Long> {

    Course findByName(String name);
    List<Course> findAllByOrderByNameAsc();
    
}
