   M S B A M L   `   `   `  ����O  KEasyCreateDump, Version=2016.2.1.1226, Culture=neutral, PublicKeyToken=null1clr-namespace:WpfApplication1WpfApplication1  5   	   T PMahApps.Metro, Version=1.2.3.0, Culture=neutral, PublicKeyToken=f4fb5a3c4d1e5b4fV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls 5   	        WpfApplication1.MainWindow   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   /localclr-namespace:WpfApplication1     5   	   PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     5   	   -   5          � Title$!  DOCAPOST - Easy Create Dump��5	   	   $��1q�5
   	   (  "MahApps.Metro.Controls.MetroWindow   	GlowBrush
 ��  � � 
ResizeMode$ CanResizeWithGrip=�5   	    � Icon$' !Resources/appbar.database.sql.png��5   	      ShowIconOnTitleBar .    WindowTransitionsEnabled .  � WindowStartupLocation$ CenterScreen=�5   	   $��498.737��6.   $��640.438��6?    � 	Resources 5       �� MergedDictionaries	 �� Source�� 5   
    5      �� 5      $	 /Resources/Icons.xaml?�6%   %    5      .��5      � $��0,0,2,51q�6   ��6   �� *ActualWidth+
 �� RelativeSource
 �� *FindAncestor+ �� AncestorType" �� � RowDefinitions 5   
   �� 5      $	��33* �6   �� 5      $	��28* �6   �� 5      $	��65* �6    � ColumnDefinitions 5   
   �� 5      $	��76* �6   �� 5       $
��141* �6   .+�5"   
   �� -   5         ��Name$ 
tabControl��5"      $��	10,9,3,15q�6)   $��2��6<   $��2��6M   .@�5#      �� $��Scratch��6   .��5$      � ���	#FFE5E5E5$��
4,2,3,-224q�6.   .+�5%      �� -   5         ��Name$ label1��5%      $4��.:-) Sélectionner une base pour lancer un Dump��6,   $
��Left=�6d   $��0,10,0,0q�6   $	��Top=�6�   $��26��6�   $	��292��6�   �� 5&      -   5         ��Name$ comboBox��5&       �� 
IsEditable .  �� DisplayMemberPath$ Database��6�   $��10,36,0,286q�6�   $
��Left=�6�   $	��282��6�   ��6C   �� 6�   �� 5'      -   5         ��Name$ 	textBlock��5'       $
��Left=�63   $��
10,105,0,0q�6N   $
��Wrap=�6b   $��	TextBlock��6v   $	��Top=�6�    J� RenderTransformOrigin$ -0.26,0.688&�6�   $	��233��6�   $	��545��6�   �� 5(      -   5        $ label3��5(      $C��=:-) Liste des tables dont les données seront exclues du DUMP��6,   $
��Left=�6s   $��0,74,0,0q�6�   $	��Top=�6�   $ -2.895,0.269&�6�   5)      5*      �� 5+      $��Patch��6   .��5,      � ���	#FFE5E5E5$��
2,0,5,-278q�6.   .+�5-      �� $
��Left=�6!   $	��290��6<   $��	10,10,0,0q�6I   $	��Top=�6\   $	��390��6t   &   System.Windows.Controls.DataGrid  5.      -   5          Name$ dataGrid��5.      $��10,50,12,45q�61      CanUserAddRows .  6F   �� 5/      -   5         ��Name$ buttonExport��5/      $��Export��6H   $
��Left=�6Y   $��	10,0,0,15q�6t   $��Bottom=�6�   $��75��6�   )  #MahApps.Metro.Controls.ToggleSwitch  50      -	   5        $
��Left=�50   ,   $��	10,10,0,0q�6G   $	��Top=�6Z   $��Unselect All��6r   $��Tahoma)�6�   $��11(�6�   �� 51      -
   5        $ label2��51      $"��Choisir une base de données��6,   $��173,16,255,0q�6R   $	��Top=�6h   �� 52      -   5        $ comboBoxDatabase��52       . $ Database��6c   $��	0,13,12,0q�6�   $	��Top=�6�   $��Right=�6�   $	��222��6�   ��6K   �� 6  53      54      �� 55      $��Tools��6   .��56      � ���	#FFE5E5E5$��2,0,-2,-230q�6.   .+�57      �� -   5        $ button��57      $��Check and Change��6C   $
��Left=�6^   $��25��6y   $��286,170,0,0q�6�   $	��Top=�6�   $	��114��6�   �� 58      $
��Left=�6!   $	��261��6<   $��	10,10,0,0q�6I   $	��Top=�6\   $	��390��6t   .+�59      �� -   5        $ labelServeur��59       $��Serveur��66   �� 5:      -   5         ��Name$ textBoxServeur��5:   "   $��23��6:    �� TextWrapping$
 Wrap=�6F   *  $MahApps.Metro.Controls.TextBoxHelper   ClearTextButton . 6Z   �� 5;      -   5        $ 
labelLogin��5;       $��Login��64   �� 5<      -   5        $ textBoxLogin��5<   "   $��23��68   $
 Wrap=�6D    . 6X   �� 5=      -   5        $ labelPassword��5=       $��Password��67   �� 5>      -   5        $ textBoxPassword��5>   "   $��23��6;   $
 Wrap=�6G    . 6[   5?      �� 5@      -   5        $ connectionString��5@       . $��10,200,10,94q�6f   {�.  6|   �� 5A      -   5        $ label��5A      $��ConnectionString��6+   $
��Left=�6F   $��
10,170,0,0q�6a   $	��Top=�6u   �� 5B      -   5        $ textBoxRepertoireSortie��5B      $��23��6?   $��10,294,10,36q�6K   $
 Wrap=�6a   $��TextBox��6u   �� 5C      -   5        $ label4��5C      $��Répertoire de sortie��6,   $
��Left=�6K   $��
10,271,0,0q�6f   $	��Top=�6z   5D      5E      5F      5G      5H      