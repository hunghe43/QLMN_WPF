   M S B A M L   `   `   `  ����U  QMahApps.Metro, Version=1.5.0.23, Culture=neutral, PublicKeyToken=f4fb5a3c4d1e5b4fV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls  5   	   A =QLMNTC, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:QLMNTC.ViewQLMNTC.View 5   	   3clr-namespace:QLMNTC.ViewModelQLMNTC.ViewModel 5	      -clr-namespace:QLMNTC.CommonQLMNTC.Common 5
      %   QLMNTC.View.ThuPhiHocSinhWindow   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     5   	   +localclr-namespace:QLMNTC.View     5   	   4	viewmodelclr-namespace:QLMNTC.ViewModel     5	      4multibindingclr-namespace:QLMNTC.Common     5
      -   5        $��ThuPhiWindow��5        � Title$*  $Quản lý trường mầm non 28/10��5      $��1q�5      (   "MahApps.Metro.Controls.MetroWindow   	GlowBrush
 �   � � 
ResizeMode$ NoResize=�5         WindowTransitionsEnabled .  $��439.5��5   8   $	��918��6G    � 	Resources 5      (  "QLMNTC.Common.PassThroughConverter   PassthroughConverter��%   &	          5   
   6K   5      .��5      ��  �� Orientation$ Vertical=�6   .+�5   
   �� $��0,10,0,0q�6   $ 
Horizontal=�6'   $��Center=�6@   $��Center=�6]   .+�5      �� $��
Học Phí��6   $��Center=�6'   $	��Top=�6D   $��36(�6\    J� Opacity$	 0.8Q�6j   $��Segoe UI Black)�6x   ���	#7FFFFFFF6�   �� 5      $��Center=�65   $	��Top=�6R   $��36(�6j   $	 0.8Q�6x   $��Segoe UI Black)�6�   ���	#7FFFFFFF$��15,0,0,0q�6�   ��6   �� *HocSinh.Ten+6�   5      �� 5   
   $ 
Horizontal=�6   $��Center=�6.   $��Center=�6I   $��0,15,0,0q�6f   .+�5      �� $
��Left=�6   $
��Wrap=�63   $��Chọn ngày��6G   $��Center=�6X   $��0q�6s   (  "System.Windows.Controls.DatePicker  5       -   5          Name$ 
datepicker��5       $��10,0,0,0q�6C   $	��Top=�6U      Text 6-   �� *Date+6U   �� 5!      $��Hiển thị��6   $��20,0,0,0q�6G   $	��Top=�6Y   ��6(   �� *
ViewHocPhi+��5"      `� 5#      	 `� 	Converter#	 [  6#   .1�5$      �� 
 �� ElementName$
 ThuPhiWindow��6"   �� 5%      $
 
datepicker��6"   5&      5(      5)      � 5*   
   $��	8,20,90,0q�6   $	��889��6'   .+�5+      � $��10,0,0,0q�6    � Orientation$ 
Horizontal=�6*   $	��Top=�6C   $
��Left=�6[   $	��200��6v   .+�5-      �� $��Học phí theo tháng��6   $
��Left=�66   $	��Top=�6Q   $	 0.8Q�6i   $��Segoe UI Black)�6w   ���	#7FFFFFFF$��	Underline{�6�   $
��Bold"�6�   �� 5/      -   5         ��Name$ listhocphithang��5/      $	��200��6l   $��Disabled=�6x   $	��110��6�   $
��Left=�6�   $	��Top=�6�   $��0,10,0,0q�6�   ��63   �� *ListHocPhiTheoThang+ �� Mode$ TwoWay=���50      �� 51      .R�52      � $	��380��6(   $ 
Horizontal=�64   .+�53   "   �� $��27��6G   $��Center=�6S   $��20,0,0,0q�6n   $��Right=�6�   $	��100��6�   ��6,   �� *	TenhocPhi+6�   �� 54   "   $��10,0,0,0q�6j   $
��Auto��6|   {�.  ��6,   �� *ChiPhi+ �� UpdateSourceTrigger$ PropertyChanged=�6�   55      56      59      �� 5:      $��	Tổng 1:��6   $��Right=�6+   $	��Top=�6G   $	 0.8Q�6_   $��Segoe UI Black)�6m   ���	#7FFFFFFF$��0,5,0,0q�6�    �� Padding$ 0q�6�   $
��Bold"�6�   �� 5;      $��Right=�69   $	��Top=�6U   $	 0.8Q�6m   $��Segoe UI Black)�6{   ���	#7FFFFFFF$��10,5,0,0q�6�   $��11(�6�   ��6   �� *TongHPThang+6�   5=      � 5>      $��20,0,0,0q�6   $ 
Horizontal=�6*   $	��200��6C   $
��Left=�6O   $	��Top=�6j   .+�5@      �� $��Học phí đầu năm��6   $
��Left=�63   $	��Top=�6N   $	 0.8Q�6f   $��Segoe UI Black)�6t   ���	#7FFFFFFF$��	Underline{�6�   $
��Bold"�6�   �� 5B      -   5        $ listhocphidaunam��5B      $	��200��6j   $��Disabled=�6v   $	��110��6�   $��Center=�6�   $��0,10,0,0q�6�   ��64   �� *ListHocPhiDauNam+$ TwoWay=���5C      �� 5D      .R�5E      � $	��380��6(   $ 
Horizontal=�64   .+�5F   "   �� $��27��6G   $��Center=�6S   $��20,0,0,0q�6n   $��Right=�6�   $	��100��6�   ��6,   �� *	TenhocPhi+6�   �� 5G   "   $��10,0,0,0q�6j   $
��Auto��6|   {�.  ��6,   �� *ChiPhi+$ PropertyChanged=�6�   5H      5I      5K      �� 5L      $��	Tổng 2:��6   $
��Left=�6+   $	��Top=�6F   $	 0.8Q�6^   $��Segoe UI Black)�6l   ���	#7FFFFFFF$��0,5,0,0q�6�   $
��Bold"�6�   �� 5M      $��Right=�6:   $	��Top=�6V   $	 0.8Q�6n   $��Segoe UI Black)�6|   ���	#7FFFFFFF$��15,5,0,0q�6�   ��6   �� *TongHPDauNam+6�   5O      � 5P      $��20,0,0,0q�6   $ 
Horizontal=�6*   $	��200��6C   $
��Left=�6O   $	��Top=�6j   .+�5R      �� $��Học phí dịch vụ��6   $
��Left=�63   $	��Top=�6N   $	 0.8Q�6f   $��Segoe UI Black)�6t   ���	#7FFFFFFF$��	Underline{�6�   $
��Bold"�6�   �� 5T      -   5        $ listhocphidichvu��5T      $	��200��6d   $��Disabled=�6p   $	��110��6�   $��Center=�6�   $��0,10,0,0q�6�   ��64   �� *
ListDichVu+$ TwoWay=���5U      �� 5V      .R�5W      � $	��380��6(   $ 
Horizontal=�64   .+�5X   "   �� $��27��6C   $��Center=�6O   $��20,0,0,0q�6j   $��Right=�6|   $	��100��6�   ��6,   �� *TenDV+6�   �� 5Y   "   $��10,0,0,0q�6j   $
��Auto��6|   {�.  ��6,   �� *ChiPhi+$ PropertyChanged=�6�   5Z      5[      5]      �� 5^      $��	Tổng 3:��6   $
��Left=�6+   $	��Top=�6F   $	 0.8Q�6^   $��Segoe UI Black)�6l   ���	#7FFFFFFF$��0,5,0,0q�6�   $
��Bold"�6�   �� 5_      $��Right=�6:   $	��Top=�6V   $	 0.8Q�6n   $��Segoe UI Black)�6|   ���	#7FFFFFFF$��15,5,0,0q�6�   ��6   �� *TongHPDichVu+6�   5a      � 5b      $��20,0,0,0q�6   $	��219��6*   $
��Left=�66   $	��Top=�6Q   .+�5c      �� -   5         ��Name$ textBck_Cop��5c   ]   $	 0.8Q�6   $��Segoe UI Black)�6*   ���	#7FFFFFFF$
��Left=�6r   $
��Wrap=�6�   $��Học phí theo dõi��6�   $	��Top=�6�   $��	0,0,100,0q�6�   $��	Underline{�6�   $
��Bold"�6   �� 5e      $	 0.8Q�6   ���	#7FFFFFFF$
��Left=�6C   $
��Wrap=�6^   $��Số buổi Nghỉ học��6r   $	��Top=�6�   $��	29,33,0,0q�6�   $��11(�6�   �� 5f      $	 0.8Q�6   $��Segoe UI Black)�6*   ���	#7FFFFFFF$
��Left=�6]   $
��Wrap=�6x   $	��Top=�6�   $��	10,33,0,0q�6�   $��77��6�   ��6�   �� *Info.SoNgayVang+6�   �� 5g      $	 0.8Q�6   ���	#7FFFFFFF$
��Left=�6B   $
��Wrap=�6]   $��Số buổi ăn sáng��6q   $	��Top=�6�   $��29,5,0,0q�6�   $��11(�6�   �� 5h      $	 0.8Q�6   $��Segoe UI Black)�6*   ���	#7FFFFFFF$
��Left=�6^   $
��Wrap=�6y   $	��Top=�6�   $��77��6�   $��14,5,0,0q�6�   ��6�   �� *Info.SoNgayAnSang+6�   �� 5i      $	 0.8Q�6   ���	#7FFFFFFF$
��Left=�6B   $
��Wrap=�6]   $��Số buổi ăn trưa��6q   $	��Top=�6�   $��29,5,0,0q�6�   $��11(�6�   �� 5j      $	 0.8Q�6   $��Segoe UI Black)�6*   ���	#7FFFFFFF$
��Left=�6]   $
��Wrap=�6x   $	��Top=�6�   $��77��6�   $��15,5,0,0q�6�   ��6�   �� *Info.SoNgayAnTrua+6�   �� 5k      -   5        $ 	textlck_p��5k   ^   $	 0.8Q�6   $��Segoe UI Black)�6*   ���	#7FFFFFFF$
��Left=�6q   $
��Wrap=�6�   $��	Tổng 4:��6�   $	��Top=�6�   $��0,36,0,0q�6�   $
��Bold"�6�   �� 5l      -   5        $ 	textsocop��5l   ]   $	 0.8Q�6   $��Segoe UI Black)�6*   ���	#7FFFFFFF$
��Left=�6p   $
��Wrap=�6�   $	��Top=�6�   $��	15,36,0,0q�6�   ��6�   �� *TongHPTheoDoi+6�   5p      5q      �� 5r   
   $��0,20,0,0q�6   $ 
Horizontal=�6'   $��Center=�6@   $	��Top=�6]   .+�5s      �� -	   5        $ textlk_p��5s   Y   $	 0.8Q�6   $��Segoe UI Black)�6&   ���	#7FFFFFFF$
��Wrap=�6k   $��Tổng:��6   $
��Left=�6�   $��0q�6�   $
��Bold"�6�   $��Center=�6�   �� 5t      -
   5        $ telsocop��5t   Y   $	 0.8Q�6   $��Segoe UI Black)�6&   ���	#7FFFFFFF$
��Left=�6k   $
��Wrap=�6�   $��Center=�6�   $	��100��6�   $��15,0,0,0q�6�   ��6�   �� *Tong+6�   �� 5v      $��Close��6   $��Center=�6%   $��Center=�6B   $��15,0,0,0q�6]   $	��100��6o   ��5w      �� *CloseWindow+��5x      �� $
 ThuPhiWindow��5{      �� 5~   
   $��Bottom=�6   $��0,47,0,0q�6,   ���	#FF8F7C7C#��� ��6V   $��35��6�   ._�5      �� $ ��--Design by hungnv-Ruby@--��6   ���	#FF4F4F4F$��Center=�6Q   $��Center=�6n   5�      5�      5�      