package springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import springboot.entity.DDHEntity;
import springboot.entity.PhieuNhapEntity;

public interface PhieuNhapRepository extends JpaRepository<PhieuNhapEntity, Long> {
	List<PhieuNhapEntity> findByOrderByIdDesc();

	@Query(value = "SELECT COUNT(*) FROM PhieuNhapEntity WHERE " + "tinhTrang >= 1 AND "
			+ "YEAR(ngayThucHien) = ?1", nativeQuery = false)
	Integer soPhieuNhapNam(Integer nam);
	@Query(value = "SELECT COUNT(*) FROM PhieuNhapEntity WHERE "  + "tinhTrang >= 1 AND "
			+ "MONTH(ngayThucHien) = ?1 AND YEAR(ngayThucHien) = ?2", nativeQuery = false)
	Integer soPhieuNhapThang(Integer thang, Integer nam);
	@Query(value = "SELECT COUNT(*) FROM PhieuNhapEntity WHERE "  + "tinhTrang >= 1 AND "
			+ "DAY(ngayThucHien) = ?1 AND MONTH(ngayThucHien) = ?2 AND YEAR(ngayThucHien) = ?3", nativeQuery = false)
	Integer soPhieuNhapNgay(Integer ngay, Integer thang, Integer nam);
	
	
	
	@Query(value = "SELECT sum(ctpn.soLuong*ctpn.donGia) FROM PhieuNhapEntity pn INNER JOIN pn.ctpns ctpn WHERE "  + "pn.tinhTrang >= 1 AND "
			+ "YEAR(pn.ngayThucHien) = ?1", nativeQuery = false)
	Integer tongPhieuNhapNam(Integer nam);
	
	@Query(value = "SELECT sum(ctpn.soLuong*ctpn.donGia) FROM PhieuNhapEntity pn INNER JOIN pn.ctpns ctpn WHERE " + "pn.tinhTrang >= 1 AND "
			+ "MONTH(pn.ngayThucHien) = ?1 AND YEAR(pn.ngayThucHien) = ?2", nativeQuery = false)
	Integer tongPhieuNhapThang(Integer thang, Integer nam);
	
	@Query(value = "SELECT sum(ctpn.soLuong*ctpn.donGia) FROM PhieuNhapEntity pn INNER JOIN pn.ctpns ctpn WHERE " + "pn.tinhTrang >= 1 AND "
			+ "DAY(pn.ngayThucHien) = ?1 AND MONTH(pn.ngayThucHien) = ?2 AND YEAR(pn.ngayThucHien) = ?3"
			, nativeQuery = false)	
	Integer tongPhieuNhapNgay(Integer ngay, Integer thang, Integer nam);



	@Query(value = "FROM PhieuNhapEntity pn WHERE "+ "pn.tinhTrang >= 1 AND " + "YEAR(ngayThucHien) = ?1 " 
			+ "ORDER BY id DESC, ngayThucHien DESC", nativeQuery = false)
	List<PhieuNhapEntity> getPhieuNhapNam(Integer nam);

	@Query(value = "FROM PhieuNhapEntity pn WHERE "+ "pn.tinhTrang >= 1 AND " + "MONTH(ngayThucHien) = ?1 AND YEAR(ngayThucHien) = ?2 "  
			+ "ORDER BY id DESC, ngayThucHien DESC", nativeQuery = false)
	List<PhieuNhapEntity> getPhieuNhapThang(Integer thang, Integer nam);

	@Query(value = "FROM PhieuNhapEntity pn WHERE "+ "pn.tinhTrang >= 1 AND " + "DAY(ngayThucHien) = ?1 AND MONTH(ngayThucHien) = ?2 AND YEAR(ngayThucHien) = ?3 "
			+ "ORDER BY id DESC, ngayThucHien DESC", nativeQuery = false)
	List<PhieuNhapEntity> getPhieuNhapNgay(Integer ngay, Integer thang, Integer nam);
}
