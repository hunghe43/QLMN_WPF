   M S B A M L   `   `   `  ����U  QMahApps.Metro, Version=1.5.0.23, Culture=neutral, PublicKeyToken=f4fb5a3c4d1e5b4fV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls  5   	   A =QLMNTC, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:QLMNTC.ViewModelQLMNTC.ViewModel 5   	   )clr-namespace:QLMNTC.ViewQLMNTC.View 5
   	      QLMNTC.View.HocSinhWindow   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     5   	   4	viewmodelclr-namespace:QLMNTC.ViewModel     5   	   +localclr-namespace:QLMNTC.View     5
   	   -   5        $��WindowHocSinh��5        � Title$*  $Quản lý trường mầm non 28/10��5      $��1q�5      (   "MahApps.Metro.Controls.MetroWindow   	GlowBrush
 �   � � 
ResizeMode$ NoResize=�5         WindowTransitionsEnabled .  $
��1024��5   8   $��497.5��6E    � DataContext 5      '  !QLMNTC.ViewModel.HocSinhViewModel  5   
   6'    � 	Resources 5         sbShowLeftMenu �� TargetProperty t� From	 t� To	 g� DecelerationRatio
 g� Duration  sbHideLeftMenu g� AccelerationRatio  sbShowTopMenu  sbHideTopMenu  sbShowRightMenu  sbHideRightMenu  sbShowBottomMenu  sbHideBottomMenu  	DynamicBG 	 myStyle �� 
TargetType �� Triggers P� Property P� Value �� Property �� Value 
 myButton �� 
TargetType �� Triggers �� 
TargetName  spSlideLeft :� RoutedEvent  	MenuLabel&   System.Windows.Media.TextOptions  	MenuBlock  MenuDecLabel��%�  &	        &	 �     &	     &	 �    &	     &	 �    &	     &	 �    &	     &		 #    &	
 �    &	 �	    &	 �    &	 �    &	 �    �� 5   
   .��5      t� $ Margin�6!   $ 
-150,0,0,0X�6D   $ 0,0,0,0X�6V   $	 .9Q�6c   $
 0:0:1D�6z   5      �� 5   
   .��5      t� $ Margin�6!   $ 0,0,0,0X�6D   $ 
-150,0,0,0X�6S   $ .9Q�6c   $
 0:0:1D�6z   5      �� 5   
   .��5      t� $ Margin�6!   $ 
0,-100,0,0X�6D   $ 0,0,0,0X�6V   $	 .9Q�6c   $
 0:0:1D�6z   5      �� 5    
   .��5!      t� $ Margin�6!   $ 0,0,0,0X�6D   $ 
0,-100,0,0X�6S   $ .9Q�6c   $
 0:0:1D�6z   5"      �� 5%   
   .��5&      t� $ Margin�6!   $ 
0,0,-150,0X�6D   $ 0,0,0,0X�6V   $	 .9Q�6c   $
 0:0:1D�6z   5'      �� 5(   
   .��5)      t� $ Margin�6!   $ 0,0,0,0X�6D   $ 
0,0,-150,0X�6S   $ .9Q�6c   $
 0:0:1D�6z   5*      �� 5-   
   .��5.      t� $ Margin�6!   $ 
0,0,0,-100X�6D   $ 0,0,0,0X�6V   $	 .9Q�6c   $
 0:0:1D�6z   5/      �� 50   
   .��51      t� $ Margin�6!   $ 0,0,0,0X�6D   $ 
0,0,0,-100X�6S   $ .9Q�6c   $
 0:0:1D�6z   52      �� 56   
   6   �� 57   
   " ��6     58      P� 59       �@J�IsMouseOver .  . �5:      ��  � ��
 �   �63   �� 5;       �@�ToolTip$ Kapan��60   �� 5<       �@�Tag$ Kapan��6,   5=      P� 5>       �@J�IsMouseOver . . �5?      ��  � ��
 � d �63   �� 5@       �@�Tag$ Açıl��6,   �� 5A       �@�ToolTip$ Açıl��60   5B      5D      �� 5E   
   " ��6!   .�5G      ��  � �� 5H      �� 5J      " ��6&   .R�5K      �� $��border��6!   $��5,1,1,1q�5L      
���������5N      Z� ._�5O      �� $��Center=�6/   $��Center=�6L   5P       5Q      P� 5R       �@J�IsMouseOver . . �5S   "   �� $ border��6)    � ��
 �����6T   �� 5T   "   $ border��6)    � �� �	#FF42B60C6S   �� 5U   "   $ border��6)    � ��$ 5,1,1,1q�6X   �� 5V   "    � ��
 �����6?   �� 5W   "    � ��$ Açıl��6<   �� 5X   "    �@�Tag$ Açıl��68   �� 5Y   "    �@�ToolTip$ Açıl��6<   5Z      P� 5[       �@J�IsMouseOver .  . �5\   "   �� $ border��6)    � �� �	#FF32760B6T   �� 5]   "   $ border��6)    � �� �	#FFFDFDFD6S   �� 5^   "   $ border��6)    � ��$ 5,1,1,1q�6X   �� 5_   "    � �� �	#FF32760B6?   �� 5`   "    � ��$ Kapan��6<   �� 5a   "    �@�ToolTip$ Kapan��6<   �� 5b   "    �@�Tag$ Kapan��68   5c      5e      5i      5l      �� 5o   
   " ��6$   .�5p      ��  � ��$	 360��6'   65   �� 5q       �@J�Opacity$	 0.7Q�6(   66    5r      P� 5s       �@J�IsMouseOver . . �5t      ��  � ��
 � � �63   5u      :� 5v      $ 
MouseEnter��6   [�5w      �� 5x      .��5y      �� .��5z   "   t� $ Margin�65   $ 
-150,0,0,0X�6X   $ 0,0,0,0X�6j   $	 .9Q�6w   $
 0:0:0.8D�6�   5{      5|      5      :� 5�      $ 
MouseLeave��6   [�5�      �� 5�      .��5�      �� .��5�   "   t� $ Margin�65   $ 0,0,0,0X�6X   $ 
-150,0,0,0X�6g   $	 .9Q�6w   $
 0:0:0.5D�6�   5�      5�      5�      5�      �� 5�   
   " ��6"   .�5�      ��  � ��$ 14(�6)   �� 5�       � ��$ 15,0,0,0q�6(   �� 5�       � �� �	#FFACB5B96+   �� 5�       �@ TextFormattingMode$ Display=�6?   �� 5�       �@ TextRenderingMode$
 Auto=�6>    5�      P� 5�       �@J�IsMouseOver . . �5�      ��  � ��
 �����63   �� 5�       �@�Cursor$
 Hand��6/   �� 5�       � ��$
 Bold"�63   5�      P� 5�       �@J�IsMouseOver .  . �5�      ��  � �� �	#FFACB5B963   5�      5�      �� 5�   
   " ��6"   .�5�      ��  � ��$ 14(�6)   �� 5�       �@��Padding$ 15,0,0,0q�6(   �� 5�       � �� �	#FFACB5B96+   �� 5�       �@ TextFormattingMode$ Display=�6?   �� 5�       �@ TextRenderingMode$
 Auto=�6>    5�      P� 5�       �@J�IsMouseOver . . �5�      ��  � ��
 �����63   �� 5�       �@�Cursor$
 Hand��6/   �� 5�       � ��$
 Bold"�63   5�      P� 5�       �@J�IsMouseOver .  . �5�      ��  � �� �	#FFACB5B963   5�      5�      �� 5�   
   " ��6%   .�5�      ��  � ��$ 14(�6)   �� 5�       � ��$ 15,0,0,0q�6(   �� 5�       � �� �	#FFACB5B96+   �� 5�       �@ TextFormattingMode$ Display=�6?   �� 5�       �@ TextRenderingMode$
 Auto=�6>   5�      5�      .��5�      �� .+�5�   
   �  � RowDefinitions 5�      �� 5�      $
��Auto �6    60   �� 5�      $	��300 �6    6/   �� 5�      $
��Auto �6    60   �� 5�      $
��Auto �6    60   .+�5�      � $��0��6   .+�5�      �� $��QUẢN LÝ HỌC SINH��6   $��Center=�64   $��Center=�6Q   $��48(�6l    J� Opacity$	 0.6Q�6z   $��Segoe UI Black)�6�   ���	#7FFFFFFF6�   5�      &   System.Windows.Controls.DataGrid  5�      -   5        $��dtg_listHocSinh��5�      $��1q�6^      CanUserAddRows .  $   HorizontalScrollBarVisibility$
 Auto=�5�      "   VerticalScrollBarVisibility$
 Auto=�5�      $��Center=�5�      $��1��5�      $��0,10,0,0q�6(      AutoGenerateColumns .  ��5�   .   �� *ListHocSinh+ �� Mode$ TwoWay=�   Columns 5�      4  .System.Windows.Controls.DataGridCheckBoxColumn  5�        MetroDataGridCheckBox1  +System.Windows.Controls.DataGridBoundColumn   ElementStyle# �  6-      EditingElementStyle# �  5�   )   ,  &System.Windows.Controls.DataGridColumn    Header$  Chọn��5�   )   !   Binding! 5�   )   �� " �� RelativeSource" �� # �� AncestorType$# DataGridRowL�$ �� Path$$ 
IsSelected�$ OneWay=�0  *System.Windows.Controls.DataGridTextColumn  5�      $  Tên học sinh��6A   %   
IsReadOnly% . ! 6)   �� *Ten+6W     5�      $  
Ngày sinh��6G   % . ! 6*   �� *
NgaySinh+6Z     5�      $  Giới tính��6G   % . ! 6*   �� *
GioiTinh+6Z     5�      $  Chiều cao��6G   % . ! 6*   �� *
ChieuCao+6Z     5�      $  Cân nặng��6F   % . ! 6*   �� *	CanNang+6X     5�      $  	Mã lớp��6D   % . ! 6*   �� *MaLop+6T   4	  .System.Windows.Controls.DataGridTemplateColumn	  5�      $  
Học Phí��6-   & 	  CellTemplate& 5�      �� 5�      .R�5�   "   �� .+�5�   &   �� $��
Học Phí��6-   $��10,0,0,0q�6?   ��5�   -   �� *DataContext.HocPhiView+' �� ElementName$' dtg_listHocSinh��$ TwoWay=���5�   -   �� 5�   #   5�      5�      5�      �� 5�      ( �� Orientation$( 
Horizontal=�6   $��Center=�63   $��2��6Q   $��0,10,0,0q�6^   .+�5�      �� $��Thêm mới��6   $	��100��6,   ��68   �� *
ShowDialog+$ TwoWay=�6e   �� 5�      $��Sửa��6   $	��100��6'   $��10,0,0,0q�63   ��5�      �� *
ShowDialog+$ TwoWay=���5�      �� *SelectedValue+$' dtg_listHocSinh��6b   �� 5      $
��Xóa��6   $	��100��6'   $��10,0,0,0q�63   ��5     �� *DeleteHocSinh+$ TwoWay=���5     �� *SelectedItem+$' dtg_listHocSinh��6a   5     5     �� 5  
   $��Bottom=�6   $��0,31,0,0q�6,   ���	#FF8F7C7C#��� ��6V   $��35��6�   ._�5     �� $ ��--Design by hungnv-Ruby@--��6   ���	#FF4F4F4F$��Center=�6Q   $��Center=�6n   6�   5     5	     5
     