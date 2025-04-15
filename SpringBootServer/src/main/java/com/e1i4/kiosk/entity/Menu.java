package com.e1i4.kiosk.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "menu")
@Getter
@Setter
@NoArgsConstructor
public class Menu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private Integer menu_id;
    private String category;
    private Integer category_id;
    private Integer daypart_id;
    private Integer price;
    private String img_url;
    @Column(name = "sub_menus", columnDefinition = "json")
    private String sub_menus;
    private Integer sub_LSet_id;
    private Integer sub_LSet_price;
    private String sub_LSet_cat_name;
    private String sub_LSet_menu_name;
    private String sub_LSet_components;
    private String sub_LSet_choies_menu;
    private String sub_LSet_img_url;
    private Integer sub_Set_id;
    private Integer sub_Set_price;
    private String sub_Set_cat_name;
    private String sub_Set_menu_name;
    private String sub_Set_components;
    private String sub_Set_choies_menu;
    private String sub_Set_img_url;
    private Integer sub_id;
    private Integer sub_price;
    private String sub_cat_name;
    private String sub_menu_name;
    private String sub_components;
    private String sub_choies_menu;
    private String sub_img_url;
    private String fries_S_id;
    private String fries_S_price;
    private String fries_S_cat_name;
    private String fries_S_menu_name;
    private String fries_S_components;
    private String fries_S_choies_menu;
    private String fries_S_img_url;
    private String fries_M_id;
    private String fries_M_price;
    private String fries_M_cat_name;
    private String fries_M_menu_name;
    private String fries_M_components;
    private String fries_M_choies_menu;
    private String fries_M_img_url;
    private String fries_L_id;
    private String fries_L_price;
    private String fries_L_cat_name;
    private String fries_L_menu_name;
    private String fries_L_components;
    private String fries_L_choies_menu;
    private String fries_L_img_url;
    private String bev_M_id;
    private String bev_M_price;
    private String bev_M_cat_name;
    private String bev_M_menu_name;
    private String bev_M_components;
    private String bev_M_choies_menu;
    private String bev_M_img_url;
    private String bev_L_id;
    private String bev_L_price;
    private String bev_L_cat_name;
    private String bev_L_menu_name;
    private String bev_L_components;
    private String bev_L_choies_menu;
    private String bev_L_img_url;
}
