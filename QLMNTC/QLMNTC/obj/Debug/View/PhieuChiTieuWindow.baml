   M S B A M L   `   `   `  ����U  QMahApps.Metro, Version=1.5.0.23, Culture=neutral, PublicKeyToken=f4fb5a3c4d1e5b4fV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls  5   	   A =QLMNTC, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:QLMNTC.CommonQLMNTC.Common 5   	   )clr-namespace:QLMNTC.ViewQLMNTC.View 5	   	   3clr-namespace:QLMNTC.ViewModelQLMNTC.ViewModel 5
   	   $   QLMNTC.View.PhieuChiTieuWindow   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     5   	   4multibindingclr-namespace:QLMNTC.Common     5   	   +localclr-namespace:QLMNTC.View     5	   	   4	viewmodelclr-namespace:QLMNTC.ViewModel     5
   	   -   5        $��
Ptc_Window��5        � Title$*  $Quản lý trường mầm non 28/10��5      $��1q�5      (   "MahApps.Metro.Controls.MetroWindow   	GlowBrush
 �   � � 
ResizeMode$ NoResize=�5         WindowTransitionsEnabled .  $	��588��5   8   $	��603��6E    � DataContext 5      ,  &QLMNTC.ViewModel.PhieuChiTieuViewModel  5   
   6,    � 	Resources 5      (  "QLMNTC.Common.PassThroughConverter   passThoughtConverter��%   &	          5   
   6K   5      .��5      �� .+�5   
   �� $��Phiếu Chi Tiêu��6   $��Center=�6*   $��Center=�6G   $��36(�6b    J� Opacity$	 0.6Q�6p   $��Segoe UI Black)�6~   ���	#7FFFFFFF6�   &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ dataGrid��5      $��Center=�6N   $��0,10,0,0q�6k   $	��Top=�6}      AutoGenerateColumns .  $	��300��6�   	   CanUserAddRows	 .  ��6%   �� *ListPhieuChiTieu+
   Columns
 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Mã phiếu��6%   1  +System.Windows.Controls.DataGridBoundColumn   Binding 67   �� *MaPhieuChiTieu+6\     5       $ Ngày nhập��6%    68   �� *NgayTaoPhieu+6[     5!      $ Người nhập��6%    69   �� *
MaNhanVien+6Z     5"      $ Lý do��6%    64   �� *LyDo+6O     5#      $ Chi phí��6%    66   �� *ChiPhi+6S   4  .System.Windows.Controls.DataGridTemplateColumn  5$         CellTemplate 5%      �� 5&      .R�5'      �� $��X��6%   ��61   �� * DataContext.DeletePhieuChiTieu+ �� ElementName$ dataGrid����5(   "   `� 5)   &    `� 	Converter# [  63   .1�5*   *   �� $ 
Ptc_Window��62   6M   �� 5+   *   $ dataGrid��62   6K   5,   '   5.      5/      51      53      � 54   
   -   5        $��wrap_ptc��54      $��	20,10,0,0q�6$    � Orientation$ 
Horizontal=�67   $	��Top=�6P   $��Center=�6h   $	��473��6�   .+�55      �� -   5         ��Name$ 	textBlock��55      $
��Left=�6+   $
��Wrap=�6F   $��Chọn ngày��6Z   $��Center=�6k   �� 56      -   5        $ 
txbMaPhieu��56      $��0��6n   $��0��6x   ��6,   �� *SelectedItem.MaPhieuChiTieu+$ dataGrid��6�   (	  "System.Windows.Controls.DatePicker	  57      -   5        $��dtNgay��57      $
��Left=�6'   $	��Top=�6�   $��10,0,0,0q�6�   $	��130��6�    	  Text 6B   �� *SelectedItem.NgayTaoPhieu+$ dataGrid��6�   �� 58      -   5        $ 
textBlock1��58      $
��Left=�6,   $
��Wrap=�6G   $��Người nhập��6[   $��Center=�6m   $��48,0,0,0q�6�   �� 59      -   5         ��Name$ txtMaNV��59      *
   $MahApps.Metro.Controls.TextBoxHelper 
  	Watermark$ Ghi chú...��6e   $
��Left=�6�   $��23��6�    �� TextWrapping$
 Wrap=�6�   $	��Top=�6�   $	��140��6�   $��10,0,0,0q�6�   ��6'   �� *SelectedItem.MaNhanVien+$ dataGrid��6�   �� 5:      -	   5        $ textBlock1_Copy��5:      $
��Left=�62   $
��Wrap=�6M   $��Chi phí��6a   $��Center=�6p   $��0,10,0,0q�6�   *   $MahApps.Metro.Controls.NumericUpDown  5;      -
   5        $��nbChiPhi��5;   %   $ Ghi chú...��6p   $
��Left=�6�   $��23��6�   $	��Top=�6�   $	��129��6�   $��	31,10,0,0q�6�      Value 65   �� *SelectedItem.ChiPhi+$ dataGrid��6�   �� 5=      -   5        $ textBlock1_Copy1��5=      $
��Left=�62   $
��Wrap=�6M   $��Lý do��6a   $��Center=�6n   $��	50,10,0,0q�6�   �� 5>      -   5        $ txtLyDo��5>      $ Ghi chú...��6`   $
��Left=�6�   $��23��6�   $
 Wrap=�6�   $	��Top=�6�   $	��140��6�   $��	44,10,0,0q�6�   ��6'   �� *SelectedItem.LyDo+$ dataGrid��6�   5?      �� 5@   
   -   5         ��Name$ button��5@      $��Excute��6!   $��Center=�62   $��0,32,0,0q�6O   $	��Top=�6a   $��75��6y   ��5A      �� *ExcutePhieuChiTieu+��5B      `� 5C      # [  6   .1�5D      �� $ 
Ptc_Window��6   69   �� 5E      $ wrap_ptc��6   67   5F      5H      �� 5J   
   $��Bottom=�6   $��0,33,0,0q�6,   ���	#FF8F7C7C#��� ��6V   $��35��6�   ._�5K      �� $ ��--Design by hungnv-Ruby@--��6   ���	#FF4F4F4F$��Center=�6Q   $��Center=�6n   5L      5M      5N      