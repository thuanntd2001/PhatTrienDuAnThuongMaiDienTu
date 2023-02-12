package springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import springboot.entity.UserEntity;





public interface UserRepository extends JpaRepository<UserEntity, String>{
	@Query(
			  value = "SELECT * from USER WHERE Status= 1", 
			  nativeQuery = true)
	List<UserEntity> findAllActive();
	UserEntity findByUserNameAndPasswd(String userName, String passwd);
}

