   M S B A M L   `   `   `  ����U  QMahApps.Metro, Version=1.5.0.23, Culture=neutral, PublicKeyToken=f4fb5a3c4d1e5b4fV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls  5      A =QLMNTC, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:QLMNTC.ViewQLMNTC.View 5   	   3clr-namespace:QLMNTC.ViewModelQLMNTC.ViewModel 5
   	       QLMNTC.View.NhanVienWindow   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   +localclr-namespace:QLMNTC.View     5   	   4	viewmodelclr-namespace:QLMNTC.ViewModel     5
   	   -   5        $��NhanVienWindowName��5        � Title$*  $Quản lý trường mầm non 28/10��5      $��1q�5      (   "MahApps.Metro.Controls.MetroWindow   	GlowBrush
 �   � � 
ResizeMode$ NoResize=�5         WindowTransitionsEnabled .  $
��1024��5   8   $��498.583��6E    � DataContext 5      (  "QLMNTC.ViewModel.NhanVienViewModel  5   
   6(   .��5      �� .+�5   
   �  � RowDefinitions 5      �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $	��300 �6    �� 5      $
��Auto �6    .+�5      � $��0��6   .+�5      �� $��QUẢN LÝ NHÂN VIÊN��6   $��Center=�65   $��Center=�6R   $��48(�6m    J� Opacity$	 0.6Q�6{   $��Segoe UI Black)�6�   ���	#7FFFFFFF6�   5      &   System.Windows.Controls.DataGrid  5      -   5          Name$ dtg_listNhanVien��5      $��1q�6c      CanUserAddRows .  $	   HorizontalScrollBarVisibility$
	 Auto=�5!      "
   VerticalScrollBarVisibility$

 Auto=�5"      $��Center=�5#      $��2��5$      $��0q�6(      AutoGenerateColumns .  ��5   1   �� *ListNhanVien+ �� Mode$ TwoWay=�   Columns 5%      4  .System.Windows.Controls.DataGridCheckBoxColumn  5&         MetroDataGridCheckBox1  +System.Windows.Controls.DataGridBoundColumn   ElementStyle# �   6-      EditingElementStyle# �   5'   )   ,  &System.Windows.Controls.DataGridColumn   Header$ Chọn��5(   )      Binding 5)   )   �� *
IsSelected+$ OneWay=� �� RelativeSource ��  �� AncestorType)  #System.Windows.Controls.DataGridRow"  0  *System.Windows.Controls.DataGridTextColumn  5+      $ Tên nhân viên��6I      
IsReadOnly .  6)   �� *TenNhanVien+6`     5,      $ Email��6D    .  6*   �� *Email+6S     5-      $ Địa chỉ��6E    .  6*   �� *DiaChi+6V     5.      $ Số điện thoại��6B    .  6*   �� *Sdt+6Y     5/      $ Chức vụ��6G    .  6*   �� *
MaChucVu+6X   4	  .System.Windows.Controls.DataGridTemplateColumn	  50      $ 
Chi tiết��6-    	  CellTemplate 51      �� 52      .R�53   "   �� .+�54   &   �� $��
Chi tiết��6-   $��10,0,0,0q�6@   ��55   -   �� *DataContext.ShowDialog+ �� ElementName$ dtg_listNhanVien��$ TwoWay=���56   -   �� 57   #   58      5:      5=      �� 5>       �� Orientation$ 
Horizontal=�6   $��Center=�63   $��3��6Q   $��0,10,0,0q�6^   .+�5K      �� $��Thêm mới��6   $	��100��6,   ��68   �� *
ShowDialog+$ TwoWay=��� 5L      $��Sửa��6   $	��100��6'   $��10,0,0,0q�63   ��5M      �� *
ShowDialog+$ TwoWay=���5N      �� *SelectedItem+$ dtg_listNhanVien���� 5O      $
��Xóa��6   $	��100��6'   $��10,0,0,0q�63   ��5P      �� *DeleteNhanVien+$ TwoWay=���5Q      �� *SelectedItem+$ dtg_listNhanVien��5R      5T      �� 5U   
   $��Bottom=�6   $��0,32,0,0q�6,   ���	#FF8F7C7C#��� ��6V   $��35��6�   ._�5V      �� $ ��--Design by hungnv-Ruby@--��6   ���	#FF4F4F4F$��Center=�6Q   $��Center=�6n   5W      5X      5Y      