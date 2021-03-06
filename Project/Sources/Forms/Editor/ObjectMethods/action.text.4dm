  // ----------------------------------------------------
  // Object method : Editor.action.text - (4D Labels)
  // ID[3F9244632EFB468D97C5D5E817CC49DE]
  // Created #20-8-2015 by Vincent de Lachaux
  // ----------------------------------------------------
  // Declarations
C_BOOLEAN:C305($Boo_withText)
C_LONGINT:C283($Lon_;$Lon_bottom;$Lon_formEvent;$Lon_left)
C_POINTER:C301($Ptr_me;$Ptr_object)
C_TEXT:C284($Dom_canvas;$Dom_label;$Mnu_pop;$Txt_me;$Txt_parameter)
C_OBJECT:C1216($Obj_inventory)

  // ----------------------------------------------------
  // Initialisations
$Lon_formEvent:=Form event code:C388
$Txt_me:=OBJECT Get name:C1087(Object current:K67:2)
$Ptr_me:=OBJECT Get pointer:C1124(Object current:K67:2)

  // ----------------------------------------------------
Case of 
		
		  //______________________________________________________
	: ($Lon_formEvent=On Clicked:K2:4)
		
		Editor_Get_grips (->$Dom_label;->$Dom_canvas)
		
		$Obj_inventory:=Editor_SEL_INVENTORY ($Dom_label)
		
		$Boo_withText:=OB Get:C1224($Obj_inventory;"text";Is boolean:K8:9)
		
		CLEAR VARIABLE:C89($Obj_inventory)
		
		$Mnu_pop:=Create menu:C408
		
		Editor_MENU_TEXT_ATTRIBUTES ($Mnu_pop;$Dom_label;$Dom_canvas;Not:C34($Boo_withText))
		
		OBJECT GET COORDINATES:C663(*;$Txt_me;$Lon_left;$Lon_;$Lon_;$Lon_bottom)
		
		$Ptr_object:=OBJECT Get pointer:C1124(Object named:K67:5;"object")
		$Lon_left:=$Lon_left+OB Get:C1224($Ptr_object->;"offset-X";Is longint:K8:6)-51
		$Lon_bottom:=$Lon_bottom+OB Get:C1224($Ptr_object->;"offset-Y";Is longint:K8:6)-61
		
		$Txt_parameter:=Dynamic pop up menu:C1006($Mnu_pop;"";$Lon_left;$Lon_bottom)
		RELEASE MENU:C978($Mnu_pop)
		
		Editor_ON_CONTEXTUAL_MENU ($Dom_label;$Dom_canvas;$Txt_parameter)
		
		  //______________________________________________________
	Else 
		
		ASSERT:C1129(False:C215;"Form event activated unnecessary ("+String:C10($Lon_formEvent)+")")
		
		  //______________________________________________________
End case 