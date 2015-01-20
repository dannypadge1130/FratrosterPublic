package com.fratroster.facebook;

import java.net.URI;

import org.codehaus.jackson.JsonNode;
import org.springframework.social.facebook.api.ImageType;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.support.URIBuilder;

public class ExtFacebookTemplate extends FacebookTemplate {
	
	public ExtFacebookTemplate() {
		super();
	}

	public ExtFacebookTemplate(String accessToken) {
		super(accessToken);
	}
	
	public String fetchPictureUrl(String userId, ImageType imageType) {
		URI uri = URIBuilder.fromUri(GRAPH_API_URL + userId + "/picture" +
				"?type=" + imageType.toString().toLowerCase() + "&redirect=false").build();
	
		JsonNode response = getRestTemplate().getForObject(uri, JsonNode.class);
		return response.get("data").get("url").getTextValue();
	}
}
