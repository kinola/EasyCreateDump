   M S B A M L   `   `   `  ���� P  LEasyCreateDump, Version=2016.1.25.1236, Culture=neutral, PublicKeyToken=null1clr-namespace:WpfApplication1WpfApplication1  T PMahApps.Metro, Version=1.2.3.0, Culture=neutral, PublicKeyToken=f4fb5a3c4d1e5b4fV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls      WpfApplication1.MainWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     /localclr-namespace:WpfApplication1     PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     -     � Title$!  DOCAPOST - Easy Create Dump��$��1q�(  "MahApps.Metro.Controls.MetroWindow   	GlowBrush
 ��  � � 
ResizeMode$ CanResizeWithGrip=� � Icon$' !Resources/appbar.database.sql.png��   ShowIconOnTitleBar .    WindowTransitionsEnabled .  � WindowStartupLocation$ CenterScreen=�$��498.737��$��640.438�� � 	Resources  �� MergedDictionaries	 �� Source��  �� $	 /Resources/Icons.xaml?�%    .��� $��0,0,2,51q����� *ActualWidth+
 �� RelativeSource
 �� *FindAncestor+ �� AncestorType" �� � RowDefinitions �� $	��33* ��� $	��28* ��� $	��65* � � ColumnDefinitions �� $	��76* ��� $
��141* �.+��� -    ��Name$ 
tabControl��$��	10,9,3,15q�$��2��$��2��.@��� $��Scratch��.��� ���	#FFE5E5E5$��
4,2,3,-224q�.+��� -    ��Name$ label1��$4��.:-) Sélectionner une base pour lancer un Dump��$
��Left=�$��0,10,0,0q�$	��Top=�$��26��$	��292���� -    ��Name$ comboBox�� �� 
IsEditable .  �� DisplayMemberPath$ Database��$��10,36,0,286q�$
��Left=�$	��282������ �� -    ��Name$ 	textBlock��$
��Left=�$��
10,105,0,0q�$
��Wrap=�$��	TextBlock��$	��Top=� J� RenderTransformOrigin$ -0.26,0.688&�$	��233��$	��545���� -   $ label3��$C��=:-) Liste des tables dont les données seront exclues du DUMP��$
��Left=�$��0,74,0,0q�$	��Top=�$ -2.895,0.269&��� $��Patch��.��� ���	#FFE5E5E5$��
2,0,5,-278q�.+��� $
��Left=�$	��290��$��	10,10,0,0q�$	��Top=�$	��390��&   System.Windows.Controls.DataGrid  -     Name$ dataGrid��$��10,50,12,45q�   CanUserAddRows .  �� -    ��Name$ buttonExport��$��Export��$
��Left=�$��	10,0,0,15q�$��Bottom=�$��75��)  #MahApps.Metro.Controls.ToggleSwitch  -	   $
��Left=�$��	10,10,0,0q�$	��Top=�$��Unselect All��$��Tahoma)�$��11(��� -
   $ label2��$"��Choisir une base de données��$��173,16,255,0q�$	��Top=��� -   $ comboBoxDatabase�� . $ Database��$��	0,13,12,0q�$	��Top=�$��Right=�$	��222������ �� $��Tools��.��� ���	#FFE5E5E5$��2,0,-2,-230q�.+��� -   $ button��$��Check and Change��$
��Left=�$��25��$��286,170,0,0q�$	��Top=�$	��114���� $
��Left=�$	��261��$��	10,10,0,0q�$	��Top=�$	��390��.+��� -   $ labelServeur��$��Serveur���� -    ��Name$ textBoxServeur��$��23�� �� TextWrapping$
 Wrap=�*  $MahApps.Metro.Controls.TextBoxHelper   ClearTextButton . �� -   $ 
labelLogin��$��Login���� -   $ textBoxLogin��$��23��$
 Wrap=� . �� -   $ labelPassword��$��Password���� -   $ textBoxPassword��$��23��$
 Wrap=� . �� -   $ connectionString�� . $��10,200,10,94q�{�.  �� -   $ label��$��ConnectionString��$
��Left=�$��
10,170,0,0q�$	��Top=��� -   $ textBoxRepertoireSortie��$��23��$��10,294,10,36q�$
 Wrap=�$��TextBox���� -   $ label4��$��Répertoire de sortie��$
��Left=�$��
10,271,0,0q�$	��Top=�