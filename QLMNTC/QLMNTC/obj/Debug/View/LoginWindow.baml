   M S B A M L   `   `   `  ����A  =QLMNTC, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:QLMNTC.CommonQLMNTC.Common  5   	   U QMahApps.Metro, Version=1.5.0.23, Culture=neutral, PublicKeyToken=f4fb5a3c4d1e5b4fV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls 5   	   3clr-namespace:QLMNTC.ViewModelQLMNTC.ViewModel  5	   	   )clr-namespace:QLMNTC.ViewQLMNTC.View  5
   	       QLMNTC.View.LoginWindow   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   7multilParameterclr-namespace:QLMNTC.Common     5   	   PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4	viewmodelclr-namespace:QLMNTC.ViewModel     5	   	   +localclr-namespace:QLMNTC.View     5
   	   -   5        $��loginwindowName��5        � Title$*  $Quản lý trường mầm non 28/10��5   	   $	��300��6.   $	��300��6;   $��1q�5      (  "MahApps.Metro.Controls.MetroWindow   	GlowBrush
 �   � � 
ResizeMode$ NoResize=�5         WindowTransitionsEnabled .   � DataContext 5      %   QLMNTC.ViewModel.LoginViewModel  5   
   6%    � 	Resources 5      (   "QLMNTC.Common.PassThroughConverter   PassthroughConverter��%   &	          5   
   6N   5      .��5      � -   5        $��
wrap_login��5      $��Center=�6"   $��
40,40,40,0q�6?   $	��214��6S   .+�5   
   �� $��Đăng nhập��6    J� Opacity$	 0.6Q�6%   $��Segoe UI Black)�63   $��14(�6O   $	��186��6]   $��Center=�6i   $��	15,10,0,0q�6�    �� Padding$ 51,0,0,0q�6�   �� 5   
   -   5        $��txtEmail��5      *  $MahApps.Metro.Controls.TextBoxHelper   	Watermark$ Email...��6#   $��	15,10,0,0q�6O   $	��186��6b   G� 5   
   -   5        $��txtPassword��5      $ Password...��6*   $��	15,10,0,0q�6Y   $	��186��6l   �� 5   
   $��Login��6   $��81��6!   $��	15,10,0,0q�6,   ��6?   �� *Login+��5      `� 5      	 `� 	Converter#	 [  6   .1�5      �� 
 �� ElementName$
 loginwindowName��6   6>   �� 5       $
 
wrap_login��6   69   5!      5#      �� 5$   
   $��Cancel��6   $��81��6"   $��	24,10,0,0q�6-   5&      5'      