package springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import springboot.entity.UserKHEntity;





public interface UserKHRepository extends JpaRepository<UserKHEntity, String>{
	@Query(
			  value = "SELECT * from USERKH WHERE Status= 1", 
			  nativeQuery = true)
	List<UserKHEntity> findAllActive();
	UserKHEntity findByUserNameAndPasswd(String userName, String passwd);
}

