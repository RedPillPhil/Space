RSRC                    ShaderMaterial            ˙˙˙˙˙˙˙˙                                                  resource_local_to_scene    resource_name    code    script    render_priority 
   next_pass    shader    shader_parameter/albedo     shader_parameter/texture_albedo    shader_parameter/point_size    shader_parameter/roughness "   shader_parameter/texture_metallic *   shader_parameter/metallic_texture_channel #   shader_parameter/texture_roughness    shader_parameter/specular    shader_parameter/metallic    shader_parameter/uv1_scale    shader_parameter/uv1_offset    shader_parameter/uv2_scale    shader_parameter/uv2_offset    
   Texture2D '   res://Materials/Effects/LensFlare1.png 1#ìHT	      local://Shader_iat1v 0      (   res://Materials/Effects/LensFlare1.tres Z	         Shader            // NOTE: Shader automatically converted from Godot Engine 4.0.stable's StandardMaterial3D.

shader_type spatial;
render_mode blend_add,depth_draw_opaque,cull_back,diffuse_burley,specular_schlick_ggx,unshaded;
uniform vec4 albedo : source_color;
uniform sampler2D texture_albedo : source_color,filter_linear_mipmap,repeat_enable;
uniform float point_size : hint_range(0,128);
uniform float roughness : hint_range(0,1);
uniform sampler2D texture_metallic : hint_default_white,filter_linear_mipmap,repeat_enable;
uniform vec4 metallic_texture_channel;
uniform sampler2D texture_roughness : hint_roughness_r,filter_linear_mipmap,repeat_enable;
uniform float specular;
uniform float metallic;
uniform vec3 uv1_scale;
uniform vec3 uv1_offset;
uniform vec3 uv2_scale;
uniform vec3 uv2_offset;


void vertex() {
	UV=UV*uv1_scale.xy+uv1_offset.xy;
	MODELVIEW_MATRIX = VIEW_MATRIX * mat4(INV_VIEW_MATRIX[0], INV_VIEW_MATRIX[1], INV_VIEW_MATRIX[2], MODEL_MATRIX[3]);
	MODELVIEW_NORMAL_MATRIX = mat3(MODELVIEW_MATRIX);
	//VERTEX = VERTEX * vec3(VERTEX.z * 1000.0);
}



void fragment() {
	vec2 base_uv = UV;
	vec4 albedo_tex = texture(texture_albedo,base_uv);
	ALBEDO = albedo.rgb * albedo_tex.rgb;
	ALBEDO -= FOG.rgb;
	float metallic_tex = dot(texture(texture_metallic,base_uv),metallic_texture_channel);
	METALLIC = metallic_tex * metallic;
	vec4 roughness_texture_channel = vec4(1.0,0.0,0.0,0.0);
	float roughness_tex = dot(texture(texture_roughness,base_uv),roughness_texture_channel);
	ROUGHNESS = roughness_tex * roughness;
	SPECULAR = specular;
}
          ShaderMaterial                                           ŬÎÎ>ÌÔT>      ?             	        ?
        ?         2                                  ?                  ?  ?  ?                          ?  ?  ?                        RSRC