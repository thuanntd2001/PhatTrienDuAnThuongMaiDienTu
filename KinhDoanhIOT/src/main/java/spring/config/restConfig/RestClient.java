package spring.config.restConfig;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

public class RestClient {

	  private String server = "http://172.17.0.3:8081";
	  private RestTemplate rest;
	  private HttpHeaders headers;
	  private HttpStatus status;

	  public RestClient() {
	    this.rest = new RestTemplate();
	    this.headers = new HttpHeaders();
	    headers.add("Content-Type", "application/json;charset=UTF-8");
	    headers.add("Accept", "*/*");
	  }

	  public String get(String uri) {
	    HttpEntity<String> requestEntity = new HttpEntity<String>("", headers);
	    ResponseEntity<String> responseEntity = rest.exchange(server + uri, HttpMethod.GET, requestEntity, String.class);
	    this.setStatus(responseEntity.getStatusCode());
	    return responseEntity.getBody();
	  }

	  public String post(String uri, String json) {   
	    HttpEntity<String> requestEntity = new HttpEntity<String>(json, headers);
	    ResponseEntity<String> responseEntity = rest.exchange(server + uri, HttpMethod.POST, requestEntity, String.class);
	    this.setStatus(responseEntity.getStatusCode());
	    return responseEntity.getBody();
	  }

	  public String put(String uri, String json) {
	    HttpEntity<String> requestEntity = new HttpEntity<String>(json, headers);
	    ResponseEntity<String> responseEntity = rest.exchange(server + uri, HttpMethod.PUT, requestEntity, String.class);
	    this.setStatus(responseEntity.getStatusCode());   
	    return responseEntity.getBody();
	  }
	  
	  public String patch(String uri, String json) {
		    HttpEntity<String> requestEntity = new HttpEntity<String>(json, headers);
		    ResponseEntity<String> responseEntity = rest.exchange(server + uri, HttpMethod.PATCH, requestEntity, String.class);
		    this.setStatus(responseEntity.getStatusCode());   
		    return responseEntity.getBody();
		  }

	  public String delete(String uri, String json) {
	    HttpEntity<String> requestEntity = new HttpEntity<String>(json, headers);
	    ResponseEntity<String> responseEntity = rest.exchange(server + uri, HttpMethod.DELETE, requestEntity, String.class);
	    this.setStatus(responseEntity.getStatusCode());
	    return responseEntity.getBody();
	  }

	  public HttpStatus getStatus() {
	    return status;
	  }

	  public void setStatus(HttpStatus status) {
	    this.status = status;
	  } 
	}
