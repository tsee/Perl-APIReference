package Perl::APIReference::V5_008_008;
use strict;
use warnings;
use Sereal::Decoder;
use parent 'Perl::APIReference';

sub new {
  my $class = shift;
  my $pos = tell(*DATA);
  binmode(*DATA);
  local $/ = undef;

  my $data = <DATA>;
  $data =~ s/^\s+//;

  my $self = bless({
    'index'      => Sereal::Decoder::decode_sereal($data),
    perl_version => '5.008008',
  } => $class);

  seek(*DATA, $pos, 0);

  return $self;
}

1;

__DATA__
=�rlE ��(�/��R� ��JM3T��L���ֻ$&r"gsk�1�2-�q=���L9������$٤�B?H�V7-������mG|(Ec@�_%�1�"L�U �:&<*Wfj�I(JS���q���3�c-�����ދ.l�'ˠ�NoB�K�3B��䀐B� K��@CC�ӆe��<:/ˬL庭�Nx��ƚG T=:!�\8�����l�N�n|#�M?�&E�H�e�����ަA�C�q�eHR��F��~N�����T���z}q�$�k�Ikw����,�+ҭ�;)r�z�@>��2"ԆR��)ѯ��Ƭ�W���Y�91<���b��4��vBH�UcSX�D@��qO\�LS���r�0�V��������J�*�Q�ZE��)9�}kW���3z��J�i���C�|C!u��Ph���&ʕ� �d�7!�NQ�z�C�+H�k�CI*\i
L�o
⩫8���7,�>�	��U�~=��#t�J֘���M���KS�����.�G`~�D=�tL���P{2z3�M�'�:h�HhSM�d�v�'|��®��Y<�%L]q�>G!���)�n��^v�ݧUb��PW%�qιC�28%�����ݔ��M�꒭Z���40����y���$�\��`?���"�IV$⭣��h���X$pxҼnSd�l��]?��	����� �	`�[�j��Ɵ��bc�x��k��X6������Uq>?*��A�j2Ri3��4���'�=�+���/g_h�"�/���z5Ȃ���""!��TN�c��0ޣ|DE'�h�p�ڏ�s>��]�`W��"����P�cuXX���²�Uւ�RT���3R�uiN�?��~�q�)�1����q�C�G� �,����d
�̺�E������;�
c�t`���o�m;�S�Qu�8hM�J���tf����jȝNΓ��Zz]�Z�~I>����A';����#��H������c������=�Qt]d2K��:��T'�_U�x��Cr�)?ah�n���"B�~���֭ī�l��j�����>��-�ZS%�j���r�\$�eY��i�H�x��&R�o@�Ca�O�Kg�i��HL���z���^�L�6g��؀)��=�7kN�x+u��_{����e�t�����t��l��we�!Y$���K��0`�$��G���J���[�O����.\�u]�ui0��<5*����� �<<��M5���h��3��O3M�~h=¹qY*l:�.󫍜�&��3�_�ׯ�]\!��GU��(�Oֶ��_?����(��RI��8�;�_�[3|Z�g�x�X���H���]1�>cQ M0*�xcX�s���s'-H~�i9H�"�1�ιG��E�Kӳ�懥��E�~� (h��^�����)?�ކ娩�BD�@�]
ũu�ᄉ>���b����Bҧ���s5�M�s�oX��z�C�-,��Y�L�����!�ޓU��FJ��0c^Ƞ�
���D��U�fcm��U�>��|B5#�)�c��"�a�X�b� �Vӱ�p.K�~�Il����SZNg5���@6�[��/i�é=�����s�
�!C��$Nk��.�^�XjrZ���?��C�����{�[��[# 9�D$ %����"z�Q��G!A�s����W���D��/��h@I9�Y_�ߙ��[����ˠ5�+��QUw/fp��(Kǳ�J��g9.��1�`:,G胺Ě���}b��R�J= @�6;�uz��C��(n,-4�� ��1�&E�%~��wzp�6Sɬ�Xt���Rr����3�8�G��W�����1W_s��_	˙-d�9z�����R����^{^Ui4WSӫ0�0܇zC������>�2��w//Y���d���=��E�d��N��&"��X*8Lģ�Aa��GQU�iDh=yDD(��(�O�	�`��7[�S5�r��Q��W
ɏ�_AZ�O%��O��+�gr��ģ*�D����;�L�w]�n����aTӠ�4��fq%����|�O��2�wv\��Pj�;��D�'�d��b	⠨?WHN��WQk�~*Ћ-c��<���j��*��ߣ�� ��?��(745u�t� ^�����F%���Y�6ǋ��X2Mh�¾C�ެU��wDh��_}�ov�h�]�q9g�>(���JB��Y����r���iI�Q�����s*q%�������^��$��0�[��7R)�����������^%xI������!?!g�������3���R$P������� 1�1�Z�z�L�Q0�A�]׻���?�9VNfI!Տ<3�.��^+��h2��R��A�yɻ�N�y��Z���-4��ð���t��NL�_j�4?�*�H�E*1�)9 9��eŲ�˶U:l �T�dۻ�XW���i��ß����Nb(r�@ΰ"_��z1<�|��j}��IK	۶=�w%�8���Q�b�u�c)A�=z�e�%'?(���`�B4��3�bݛI��o2���:k'oHBEѩ+�u[6�M�yY��hj�����<�a�u]��	Dp�����_~�R	�4#�4���QOA06V�#"�I�Й0&9@8�dRz/'�Eǅ�6V��^F+|B�W}&�܄��v.BP?�:9Cf��ܨ�h�ke��	�%�u�_k��}���*�Ic��p���)���@V E����̨&~��Dz�\��UUq��LsFr-=�$~ʋ����#o�o
�����"�=c� ��>ɧ�
H����?�}�J��dj@��L�RsƗ�C���d� �>#hW��z-/�@�����Nz���O2���z��lS.�wK��b��/B)Žר�*��:Uܯ�_�~����7�n��¶�5}�>�JN���τME|k�D"�6�8��O�e����m,W���d���2	�$H���xe�uj��gc�X�M�UWM���t�d�C
���%��>W�'�P���J�SU
�4	�|���r���ʕh���l`2NGӹ\��G�*@S�������x���;�W7E�v���S�����Cr{J%	��a1�"z�b˯pp���E�N��y�:����p����@�a����z����d��·J�L�
� 㽗*prȌ��bVh�O����ˋ��X,�cT���Q����>�}�sS�.�:�4ku���.�8W�ò����7J�+�������z�G6.,p���+���T�L��95"  A �R�P(,�$Re�>��S��Q��8F�0B0 ��A6����t�,������3+��4�#��5zn'	��>����䰩9�	�q�˨��z��І�w%���Pq�bl]���"��7F�<7^�ϣn��K= O��V
�g'Ӵ�f�����:�5�����*��,6)ot���B�$ t�fw��\�_f���(g�kQ�1M9_a&<�dC���3������:�E�N�����{V���ݘ@���W��Q"���)K]�ޢ�h�c��GiYf����D��BEƷ`@�E��%�1M}�,�{��(��;���[CS�N���(xF�9Kg_��b��"5��_Ԗ`n!c*���[D��*'��LZ���:�ׇM�M�o&4u<ؤ�z�2
���d8o�����y�S��tDw�+�'��w�Ǒl�����8g����vg+��c�A,E���)Ev����X�P��DY�Sq�%�L�~ �!�ל4u�������A�f;!��Z)�}Qy�"�hJ�c舜3Oc5RPR�eR���Փ��+�%���1fW�m���4�5�PEK�#	��\��LF�Ľn
J�C�~�(
~Qy�мb�fsđ��D��}�$����*d����	�Yo��2G�4������%#�$ #��
��{�j��B�x�h�&��etf�g���RPYxjM��a�x�XD|A��C|�� ���5(r� �m�f\s��rd:S8%y��uEQ�� �k�e*c��4��¦�&8��o��m��ә5�����hRd:�D7���+�~����I��+��a��Ӈ��M������P����\��u�Uc�a�9�vh�<�c^�fw����|H�(-2�_��Ԧ;�T���h�%�$�?Q�ڱ'�g@:>��?zbA� Q��\Vn1y3���������J��3�Zp�v�M���&����
�|��{E2c�3�ۿqե����~>�L�����|D
�*�!��#���쯏y �2�LO�;l�a����#���*���𝄭r�M?�`��A�AD�4�b��N�8S�W�� �z���NܫE�
Y(���Ȯ�\:8̙饇�"�6�ubn�C�����?�&�%?��.e���'f Ik���F�j&ˑR�56
0C,,W�%(1B#���l�;�! k�.��)l�^ذ�\�6�d>���4,������Ȓ��	_֖�4�{ԛ	a��CH_��98�0g���0#	���fz�R-L~z�k��Eh����1̄���{huI�8LŹ��@�����ͤ_�?���~7y�������.�� u���C�vz�lHAZ QX�1I%�����1Ԧ��8�C�[��6x�c�6�X[�j2�f�K��Q󓹡�Of�[x�;4��VW���[aNA�����l�����[�=�Ҥ�vLKD.���u�~�삷�]��P��q��}���Q ��<V�E3�	���-�MX�RT��sЊ�~_�u�@��ֳpz.�u�tK�yo���� CS�x$B5��ĭ�L���@e��O�C�)V�iG�v|���z ��m�i$T��3<���5��9m�i�����Fk3㳀���?^]���au�חϜ�3%R�햶(��G��8`��ٓ�.�]�$vl�E �.}݋dD�g@_?{�y�5=��8X��9&��s��zyKx0�ɟ����+�L�zX��bp�Ŏ+����`g��~�/�&�mE�E�|+	!��֍�IJ|da�)�1Wӝ�tD�v��L&h����\^C�w1�z�ݑX�6'/���Wc8��?G=.r?�W��Z# kt�'��b�w}қ��`c�/��q(-\c�8"!;�WX�Gi<��,S5��~y�ܥD�>���+�'�{`4��u�����r`�B�3n�y��$�k[��}��׌Tʺ��(�s��$��-O��fm�i�A?/�dR>vv��L�~F�5�W&}\^*�K��1n}~�by�Aڬ|��b�4������fE���X�!gaʦ��#��+�s^�i�	,�2�%��g�­)p*��o��F@HWk/�����&�ȏ����cqbr�RMV~�y�&G���+xTtP�Bi\�m="�n����s�xdN����� �rA�&�aAg�o�N8�@�����3����M�\U�L��f:��Xh|��m�{�pTã���n:�J�8t������n@����iL�rR����2mܜ���ԉP����&��2̆Q�f�pXz|{T2c�[a���:!�֫���%�KNY������O�cV�Y�.<JC�2]Q��;P)Dy;H�<���DWlH{w�S�D�T!��X�*��x�?V�Y��_~�gc �:�S�V L�:o39�]��d/��� 2��Sm��H���
!@2.6�*�F��Ō�Ԉ��&v�g3������Z��p��^���t�g��%��r8])诀<�:�
���I���Ϝ�,����."����X��^t�Zf�o���N��VE-������jӶ�Wh��g�I���L�Y��X]P���<(9R3z��h��ho/�9jB�D�����QR	xHA-Mn�?Z%�t-m4�1���+f��������qr{��J�g#X��m���쾖�f&J|W�؜�e뢼���KeZ�.�ޗFnn�SE5H���(�Bn�G��F�r+��cTOS3�J�� @�2y��Ͱ�h�ɵqzߠ�]�����wB7�_�C}��O�ЪO9�3n���ilcKQ#$6����jl#x��%�B��:19*QC.w\�4���!��`��i�vߺ��9�k��0X ;�> XF�O�8ű�w�]5�a�U?9ج2%�Ý�c�T2��N,�Ԍ@�1�CK/M���y��	��ǃ�_]hѲ ��������#�;8��?���L���(ɂ@�GS��A�Z
P�
P@�{��;����z�[o��fĵ�>��
6 �2@5�>�p�����h�S3�ߕ�l���?�J�$\�P}e����	��PRO$�I������5��幸�_y��6��Zg
@���Ku���8�c�*��>��s*�p���y;������Ԇ��@���<$����љ���1)��&��"���Bi�.a�f�� �%V��$�ԿN'��u����a.B��e�KH�9B#�+���?M��EX�֮MBZ��GL.}<�^����$$�{3}�·G�!�㢐�ڋ-���
]zK�9N~����F��P�d(07��*�.)]��L�;�&����p�O L.6hka�����T���H�2�T�o�iJ�y���w���̗kr��#��5�]�w�N�`[#_��7��+�.f�n��q[�+ؓ��L�
�v�^>�x.�GC�=AX��v����}���$2��-�|/��g��5[���˒&�p���!�=@/��6Zj^���(�L�cB-d��ֱ��K�f�$���BZ�paf�$C���^���Ʋ-��	���(�fs��үoԹ^�&�=��'�[e��0�Ip0��b��R��)n�A�� ��9�ktjpO7"u-d]*j�Q�"����CH�,8=P�Ht�~��a���D���w����}����H�4 ��Y�?�>`m:a�Űf-�`�&sdP�R�i���-��y^� �)S���`�ꓻ�J w�UݒAUw�9j�a&��/P��X�aȳ��#���
�־�-�&q0H�B�;����OH;1ݼ�:�A
p/�(M��E#6�(�+��)�)!���|�<4�㝘��b�3���k3X#@��x@�"5@]�_�,㝐l���v/�#�A��$�hI�n'�"�Y<@� )ԯ*h�[����>}��S��<V�"���Y�0�E�f�,��s-`�׸xrж�'|�s����r��fk)jރ�La�Z��p�U�i[�����).>:�g`H9���9�	�?ҁ�Y�������Zwd�O�w��)7���!�-�aJAD�Z�uKC��P�H�m}Uo���t�P�	����"��z*{F�f�s3l�ȩP����>`�^7  w�6t9�EޒxF`����L�sP�G��������K�v�{�o35�,��X���F���A�G�_V�zԱhY��� �öV2�\�U�"7�n� %�*l�������ט��ȃ����sm��Y�v4V'�-���!���Hd�4�?q@��CH�KÌԟ=���'Ch�0_���0�~��"�`��"��Š�!K�w�l���8!{+n�/hq���^lx�����:�We��[X3%�-�>��+a{w�������aǭI��  �R��r��4 �I^c�z��_�
����IC7��aű���`�F�7;[��zsr��� En�����a)8t\d�"x~���qɪ�+�k���Wu�P�Ta���AA�����g��0Z�rwA���?�?"4e���؏�<��KPi�㰽9Go^-�p�'7xd�l�OEwI��@A_b����a"�� �:�ϰ��Ѡ=�e�4�^����b�2��WS�Vڀ�$�"۠dK�<3�B����n�d����()�"��N@����Q�eq��ĴO�׆I#
�-X��V;7������ ��Dɞ�>ލR�J0��'���h�8�Ԅt��.k��h��t`�������#��������J��x8+o�9�C�1�~޷��d���g$�}�-�H4^SJ��KR�݆V��!������Z�������XCn3ʑv1���Mo��v�;Åk^vWB���W��U��Fҩ
p�,���fwF]��k6��� �8[�݆�>�ȶ=pl�T;���$}-E*��3�������S������ढj�.h �I;��n�����g�~�6��2����˝v�b�D������Ѽ�§�`���Y�*�Z��9�{�ϬMN�4!�[�¤����0əu4��xA�y{ v���iE94��e�����G���i
�{���<bq}�.�m��q�oJ&�<�w�ԎBt�R�?��&5����&u"}��|�2{�<��d2�#ė@l�"�i8�5M}� /�D��A1ƥ`b�|_��9cL�?�o����nLo�����z1��s�PKe�ֳ��G{���~s�/�F�с� ����d#+Sࣄ7���#��	t���ˈ��1,<���.؂Sn.�@�RH������n����O��C.��e����@TA�a^b��UG�vɇet��4>e�M|��#L�y�Н���LD����C&��8�2	�jrP%����B��FF���i������\g-/��B 1"��z(l��)VC�'�XB�w<1)7[	����^�ژ
��E8\I2T9�G0��A3��:�ޤq�G�
Dp:�a�K��W�����i�i ��]F���.l�I�\�R���N颮�e�d�6���oaN-��<��+�4�>"1��T4�.R����b�~\=kI 3_1��w���i_�ʏ�����X
B��%yM�h����8�>������$�a�#DQ���<O��U#x28

�B����p?���:�#g��Z�kY,B�䝡 >I���B2��Jt����Z>f��5����}
��MZ��'u��1�ް=�^����8$��%����?��ޯ�e�KSQ�"T�Kd�q��,���"��Boi����AÇ�߾��!X!#Q�nfb!.B���>��6�D�=�&£5��k,���nx��B[1܊(~�ynǷ��:HE)*���|}w���� �^� 餫Z�o��M�,�_U6��A�q\�1M�ݗΔ|��ӹP/�ܟ*����j�0{fj�x�!��}��[��n@ʽ::�<b���Х��[ڹ
�5g�hR��/���B�Bi=�8��{��ID)�^�ڱ�+���qs���b�6)��͊��JV�:��X;������?�'
�
V��4�ic&��Y�e-m�~��UTiV)8*��O*ﯘ�A�1c���#����-�-�B�:��UH���&0b��ǔqr���@�X(8M.<D���a!�Xۂ��Ks'�[Oi��ש�(�Uo�9��j�)��NŁ�u7�Q����\�����uW�uc�u4}�����k���R�D�1)ڝ��*��Ս�"^�T�}i�_�֫�?@OqbI˟5X=�Xh�-
z'X��F�9ep6Yxs#���v�$dX"���P����,�����ʊQa�8����ib)v�CU�.pRiB�ξ�4|��=�rv���5Ҥ�]&�`�9&�ôe�w�ޠ\n ���`�X���J��:�S>3`��~`�X��P�����o�}���c��Sq�-C�6�����(��G=���<�S.��0�[�s���%�g��z2��Wn����a<��4rU6`�(��3)�<C���{�`�G�0��1>�T.���;85��iP@<|Ap#>'��[����08�`P�-1��j!x�&z�m�H�pd�r�*\�b�	�ʅ�ҷ�Vd���8$��T�����Dٟ�-"AY^Ʋ
QH1/͝'�Y�\�����R�
S'�PUi:��w�/�i��Jg�1ao�~����}͌���
���.�B��Ǎ4-ܮl�Z!k����.?x��iG��m��r\�L�s\o���%�uӦ!Z�֕A8�B}
��<��:<�h߀J��Q����k�:����Ү1 �m�0-��N�qD��Jݸ���7�e;Wq(c�@1�鹧^�L ѭ�D��Z��� �4�<�i)T$�Me��Ej���Mk5I��zqn��m�-��Vb��@�ԭl"�5?�lr��K�IЎ̶��;K�}T��n�|��{�D�")C��KpF?v���ğ\�!𗲅�_2����䀫1�m5�K��gӝo�Ĳu�����}
`T�� �L��(��#Yռ-[1����5��"/(_�)ɷn��>ؙ�\��g(M��xM�<��I��vN`�4�k�
p�GA���0� �uG�z�	z��HܮB��pѲ�Ñ��j"����:�w�'�
W�_Q ��S?�L:e[���j>�1���h�Ә�hKǱKX�z�^=y�bB�2��G������˧8���ZT����V�Ԕ��$�i�CuT�����4GXi�c�f�9���*��	a��	oOp�}��?�G�	�Ɖ�%yQ\��V�pAuV�f����+��VV}8�8���t!|7։}��l{r��@����J<T��F':��ʺ�����N���X��Y�H=��@���p�)ocv 
a�s�vy��i��Tm�(j����M֘8�����p}����1:���DA)�?�'1�˰5�m:u@q���Ή1HM�>��56�K)�2)������c&7�΋)��n1��/��E���$�ZA0]�8
j#�7⥜kTn��\���"M+�P�²��jA�:�g�5G(%��g�֐��k�2F	\�A�"�3�j���>�~�G=.�7)%���g���uze��$#Cj��l�/�j�W/!Eb�?q��+W����qI�ӯ�I�������f�rXv`q��uRS�vT@��{�@�p>��=J�乹|�R^fGQ0�d�1$��x\����w����)z�;� Wn�o�W���}|��������J�'@C�;�Y���Ö=�<�8�1l��ZZ�\nb��NE$������ħr��j���A�F�*��)j��*!'e�mE��
��>3R��A]��_����F%��<�uOp��T7mԢb�Pd�%l��a�>�m�T{q86���hYtn���L�1�:s��؃�9��|���s�}}���kk�HK��9��Uy�2M	e�����o�F� �;;f@9G��{?r�9��jXC)�3��'7:��ƈ��r) "��a�E�)P�?�[׍ ����ee�*�6��qI�M�1ӛ�f��,�τ��pHK5� 8�u*,�js9!N]T��L#+��<����� ���ع���$	�=\�N����A�I��G�6.شz����E�9h���N�X�9D������_����24w�;���O���暬U-ҕ6_oN3���Kr��}�Pm!���������́3z�I}��DjF�> .���>ɫF�V�pW����=�4��K����?���N�ڞr��9�4�%V���ǻ&�g�b��V�zmA�~[r��d|�yˋ-
��ti�%{ϤǴI(���UB�6�I����H:eI���GWV�;?�x�
:�O����;j�X���a����=HR-�Ʊ$�3��S}�u�f��1&ǵy� !�sG�kY��L�
���I�������,��ً��R�uv�(9���S�hf���k�˱����2�7�Uf{�A�J���y�Q�P	����'9��n�6V�(�i�G�_�5ā�.Vȇ�B��I�EV��	<������Mo3����s�߷���j����#Z+ַ_��H���ִĤ���h�V�& �+Z탵�~С�\0��l�݊S���L}�ͶH����B\�����^9�ƌ�,-:�d�l�P)��6���O���6�ŗn���v.l��6Z���8���R4	�\��EDaT��r��]�I!��
EG��!
Agu�%k6ݔ߹cs�f��JM�t�y�|���S)]��]y������5���[@?_�2��ދ�{u�R��� !�f��dG��/۫�f� n�,\o	�,��=�B�]�(K��&a�W�$O��j>�6���ӻ���n:�D����>��!�A��&�D_]�;��N�
��B��(єrT�q��Z��{2��l�#�D�_ �����Nz.0&E�T?n5��C��)�U����g�o&o�@��mv(��>6������������q5�[צ�Y�j_ǩGI"��Z[b��Ιf;��-�z/}\qo�z���1�%�^l��\*Zᢻ�k�3�^ή-7A��dgh����|@)�a����T�R��[�zdgNDV�U��j{���p�S��^����'��`&�qi���;�j��D����D�E_��z��Ll
�Dn-����6~�UG�������#��5K*��菛��!�0BVy{�b-�+rM��_�f��n.�U���=�VŕZ1i�0�=���&��Y)��ˇ��y
�UR~C�i��-�o�u��T��T&����3;��%�ܔp� �3�q�Ǳ��oC�!c�1 ���Gj�����	B�b����`�{v9��}��=��:���(]��[�2�b~4�9K��d�i�ZO ��Q9A���-4t����F{@>ިH;�c�]A����TVAAdG;?FRP̢�Rʐ��1����s��� �1+�	a6���;t����]8��gX��As��]�C�镅_ԑ��
����e�ۘ|�	v�`�1z�9��hev������H�R���lJ]+�?/����#�~��}c��|���L�pr1��J�9e,!��l�X	�(E��q%����G+�9~5s��m���i"!
TP�%J�=k�s`�B�q=u��>�	�ր����=(�4��U�Y����>�Z&a{Ƶua?dC�F͵x�B�2�|]��4��A��T���(�:�A}ζ!��T��C(j`I�9�W���)�$�ᮢ�h+��Y��bꫀN��4n�=)�q�Ve���Fk�&B�j���Q�Nh4Y^ODc�pj���Z�0��~���O�iU�t]Rc��%����o7-�^[v����,�!�%�zB �2��'�/L�6���ǟ
J$�����/6�N3�������)�%�.7�]���G��Yϔb�㯾���R�%��~��'H!���2ǲ}@R{��8�n�^�cZ�������}���v1�Ue��}_[�!�h��+�4d�*�p�C=�P�VN?�,ҝUH@�-�9H`�+]�ж���N��QT
7ey����|X��m�p��%qS�Q���,kH\ӷ�q�T���j4:���.���Z�d�|a��7>�-<�tӹ�{�Ɠ%���B�f�����,;en�~J�f�p�T�M�Cs}�u��0E���L�`\7�S����y!LH�f����E2�V��.��ف*B��e���!W�ԅ�c�*Ij)��$�\a�:Úܸ��Ђe����A�mY>B]�~�O���Y9��ns��4z�!Sk|���1���+��^�+w��52�%�(:D��0L{�
�R�CDM�'p���r��t�ȿ�š�$?���47c���˗��CD��O���$�B�����vV��%m�Z�	��2��]��'��k-��\��y�|�
?�z>��1J�9�Q�W7�N4~JM��3Ox����e�%�Q��,f�S�0J~����wm���u�DdH#q�����*c��)�j��R(��j�(B����9��|a�t�5� ⋱?j1����T��iK9��Ŕwz���]t`Y�Sqߵ�1���sY40��z~,�=b`O^[�wp:�n������	 
�d����)�x�b��-�����{�V�$���������g����&�G�,��C�"
��ft�H�%� �}�������xl����W�45�c�Ϋ���8�R ��F�����/�'�������Ve���t\(�_r�v�c�xZ5�2q�n�5w�궎Y����K���zK�=C�TLC$���E��D��6�E0l*�c���� ,\�=,���Ə��&Ԧ�	 y������1�	'�攛�	��v�5E�{�I ��4���oPd�^��[ذA���h%��}3�kM�h�AՌ;�m}��@�O`[P�,Ǆ�2xyH��F��� �@��v{Ğ	�D���&ng��0�������O`Q�58ƹ����]��:@q�@YFrZ} :�����|a����}��͈�<��e�?h{���DIo��!��\��`�|��Y!���f?�=���[��为�exk:���Dv���l];���;�0	J�a��ݗRS�k�?K�b�8�"E?��΃�j��_\P�u��s_m�A?:�u[�f��xNTd�7��4|-|Ll��fytdIͪ�Y)�Pw��p"v�IY֙Q7�]����*�����ș��L�4(w��H>(��&�h��D��{���
�	أ���rջ��+��Po�,�n�㆏%��������$E��80"�����!����e`��XL;UN�И�u6�[��Y�ͱ�9P�-�T@�Oݥ����,&n�LJ3aJXn�x�U`�C#=}6���_��ڵ��<fA�O-��i�%���ѐ�Ϩ��B�KC�.�8���t-���M��g`	�҈�@&�e�%�5ewb�X�`#�/r!�T��>��;@�$�� �dN���kT�E�ʗ�O���9�ø��0�x�ÿ�X���$�s����Md��^��m!K�����X��2��7����F<nJ��21~ G�:63�A�����vesg�e�?j�n��m�m�o�Rt'�g�'�7l����7e���'�EW�r�I�k4���K����/Ip�U�f�6l��o���<,=}�g�
u��n�mJ�=*���ӥ��)�%�����jK�m|���:4�;�c�����Oič>�ږ��ʮ'���~�}�&sR��͌D)!�KJ7�g��@��N��Sjw��'''�'2���r9��	�$�IHR��		'�YՔ~�$mYO�]鞍+���7��{���O���h�]uU]/3{B��(���ĤO�5e�������o��7y���Ո���E�{_S���iI)�D(�9���_ͦ\�����͕&��HMto2���3W�����fH:��덯��j}P����f'���S��~a(��4 !�a�A�ӘQ�f�?����O3�1�Xtۡ�ֶwȃ���ꮠ�N2d�l�@��-�U+)����\FFF̨{�J���n�R�W�[���D�ZkG�׳��ݜ��jx>686:��C�.���bX^��o�Ӡ���W�5���x~�Z�7�'��y_{���o���z6���%���Q5�w�����Yu#ś�ke֛���w���"�J!W�rq�W������?��(Q�][Ҥ��+��F/ Q(�Q�TD/*�����'
�s����. 9���?ꝚQ�<���p�O�i~�s)C.��ME���|��:1}�b���A�5������fc�^�ӊO��Ű|H�a��3q��.yfVX>-K.A(/�G��I�+���r�զ��@���d%��O�M�	�~�"�Y"�D))��5U?:vp#�Z	�&��4:�F�P�($Z}`}�B��lH!-/ƙ�BD��ٞ�sҊ&X��H��8��c=����(��3���R�k�P=K�l/�����Z��t6/��k���AD���ٜ2w����(��w31�Mp~��[7_��u��>}k���۷������ 퍩��ffZl".o�m�흭��a">rՖ(>�*��ڶw���OO�i�����mѩ��ڤ(_��ՙ����z ���0M��v�=���o2�!yR8ҧ4��1D�o	�8��B�%ǒX�k5N*K�/��]!�%��~���~�|�
- d�?o>�0�b�m6��g�i_�������A�>}��D�S<��f��Wڹ[o�
E�'n{{�`mE5Ez��撅{�}٦�;1�%%o�J!�ʵÓ����l;����oo﯀v���!\��ݝj�S�{�%��KL���1��ֱ��2�������r+�A#+�p\<��ɂ~:�"c�q*v�]�R#Ʀ��T���l�H�7�b�.�����oX^}s��͆�AU�w���'+��{kMv��Us����%*�<�m��D�J~+Q��E��8�s�Iq�����) `��N�_�3\ư���bl:0z�^FP(�@	f%�%���l!m��y�r̳����`[���۝ٞ60$]����I��闍��Q�؅�X�z�g^Y��߉Ҷ�5��O�����K��"j����J2�Pˋz�5o� NU���ǰF��l�A]�ϯ~E��q����n�qq��O���J��RG��&ؽ�d_��_'ε%Ǚ*����]��5���-{�05H�?kU�Ԫ������� 
�/̫)�
KV�ϵ�m�<>E@c2���`p5��86�g���(lo���.$�t�����x\F���W��C����"��`C��}���|jxV�A�aֽY���Ŀ7�,6��)i�^ǻDh<Pz��p�ݽ[~������%#  3A 	��`<4��;���	��M���Ј�@ @d�&��B���!oN�ػ⋆���~�U��=v���Ě�!��I)ѸO�z��)�������-狇�t�-�Xn��D��k&/�(��N?��K�G:�p*{�,��[e4�1a���u�VG$�wסǖu�j�Q��+�3��*.ԓ��pǆ�%�R�3œ��e���c#��9P1�kĩ7N�K���I͇�~kQz�KJp�^.	�̴���1Ο���'�օ� z�{o :�P�D\;f���]Hu`��`8��6��$�'�!.�Z��Ẅc���YF�*�O�@��������I�yz�b�@�om�!ix��E��C����	=6�&���_�)��p�!b�b&��.Z}�f�R��0��q���(GK�b����_�3��:x���%��>.���[W�Q����~�s R��x�mҡ|V�jp,�°���&��"PڷJYV��)bH�#?��K�ABv	ߜ�� W-I�W�yܪ��F(��8q��L��i�d���gi���k�-�������q�yU Ȯ����\	����1��%�ꦘ�µ�X��mpͰ�8ň�����lT�_�S��X�����ϓ��Q��~vmh4<K��3�|��>F�]����tl�+��ʠTNZV|�f�U�$?l7*~�_ژ6�/�g�>���)B��R:kl��#�O�%5�pf	�j�_�\^9*~�C<LVs�n�+}����!P0RA�[�
(������&�!Q��^c������B.�_�o (���Ʒ��ȻR$M+Gng%�i�ӛڀ�HT�R��LΣ(����~O��"�	��R�/ ���d������4X�K��T�`� �x'��i�_�W���-��Ɓ�d�H�n�@W�����X�5Vb0W۵�s��RIS���+�pN�pe2\�Ik�u�j�`����0pBɞ�nW��)D���Oi�[����h�0��0��w����(�8�:t�5��(Z�-��ױ�����sT9�e������?�;'Ei��Sg!��3��~���a��i.6�7o�}p�)�#��{�Zĺ��!|u�:>�8�KTa&��&��TV8c?�>�F>46�f���������/Q}d[fo/R{S�t�(�6����Vo�b�C�)j�����Q��sI�ZR��Z������x+�"�ҁ��h�]�,�i2�-�Q؄�Mo4�=)Lm��kO���!��h�T��z~�����D#����)`U�U>i���'7���k�4�l�T���߄B�SBb�y��f��	�Ğ����2���@�RO�K����I=#�3f\v����a�u�L �ͬ:�X�+A|�&�*��XeC��
)�Kj��3?�D����FK��1%)�о�v$��ڝ��0t8�3�:��|��  @�8kf��k�n1	G�U�#;<%�aV։<�	(�]ַ��a}y� ������S�T�ݢE��gua���)����A��f�s��ъ��vra�O��N9���2願]�3��@��,3�j�U�)��+ï����\�O5�4ש�p��yE��1@1�Y�i�&��L��ŉE�p�����5�1.O)H�C���^���g{C�����f?Ι�2gm��Cy2�|M)B�$��9b��%�RS��HK�hʥ�7�xgK��$�1�h������j���=��v嵼�8Z��L�e}1m�Ġ�C����9N�`Hz��Wl�i�����&�m��W�0K�op��Z%���i��<���?gGۺ��1 2(DK*/�A��|�5�K��c¬ᮜ����V��t�� ��']���C�\'������V�O��HC���q:"hh���ᔈjm�a�Ó�t��Ԉ���l��萂��f���p��߾{�<OݦR2���|��ٌ�!V�8�xZ��W��zP�����>���L���}��D�jJ^)��q�d69����Ļ�@!QBj��s��(W�{�*�O�X�3}��Gpx�µu���<^�7a�qۂ��W��Ѓ^=j� d�(V4s���&��w�� %s ��}m��*3ߞ3�Ѥ6tL	�&g��瘊���h�[*۪u]�j�k?���a#���y�Ӷ���z��=v6qJn�+08%���������7�Ӻ@��r�Hܙ了j"`v�8���p��$<h�G���_f����q����3q�
xi���4����sU��W���ؠ��+/�����jfEv��{{�16/΋%k��#�f>p��6��I���r��g�x:,����*m���ʐBMom�l�F�BX���I��1ֆ��3�D�%Z�}o.vک%3Vc�R����Um`仁�b�W����2E�.��T��z�'Ca�'K��f��K���.�� l7���
ĳk�6��
1ڬd�.����,�����-��	o��AW\S�%`vs��-���U$d�RzZq7��TQ՟Fu��ר��c���,���$�]k��t(2h!�<:#���EX_n�$� �Kώ�QYq)��m�=�k��l�:Q�p���+��Em���L�X��(���R�o;�T
�$��wi4;����0L5i=hhBc٘s޽$s���s���)�H{
���Foh
�:�AL�r1^�	 :�-k��L]��½^\��t��L�-0Po��3��!�'�*��tJ�Y��YGv!_���1p��Փ,������ۺ$����ƚL�+5�8�ҟz%4򮆩\��Hj�D�+I�Y����!�^5˫p8��j�!χ�sDN�����wu�{�)���J	����>��@]��hi��M�h"�b��&T��]|��g2W@�m��k�e����8�;ʴ�I�B-��֕���1x�o������q��%��0�O�G �ꆹ�k��\��N�MzW�����]�Y���n��"/Z�Ӓi��<���P.� ��lt�љ/7��Z��2T*����_(���#`��нG���$��[	-����j�_A�8��%g6�����daju�?���yuĚag|��_��)������뱛���D�� Kߨri��?�3�&p�gJj�4�d�&ZZ�e��iv[�~Jc��d,S��:��U�+��jꃟ�Ί�d�mYA���b� y<����n���4�ǈ���nor���&+��Jí#��!!t�Ԍ���w'v��"E���l�(+�������������3	8�7�m�`�^%���J�&R�+�����ݚ���=%�k��?� �R�0�?�^t���&�K��ZK�޻��W	Y�V2��h���N#"H���RԀ{A�Uy�>�����)�g�,lo�I>FU�1��������Bb�껤G��/�?_R�1&s�s�©"����x\%O���I�x#~�kr屍��^��L	�`Oz[�F=8�y����`��۝+m�1�茹V��V�{�v�x�Ëb�_9��R�� ��i�욺W�k��l���p)X�"
N	6�6�yZ��v+��x�?�&F�&y�m�ǽ�f�����0�1%Ng,�P0j��m��r�)P5�7&ƺ�v-;�E�ⓘ5���v1��ۄ���@�F��-5�7?,)%Ci$P����e9��!�P⵹�o�懼����޿�C?V�� �)}�<��O���O�zs6,��t�^��[��kC�O] �A[Χ�� ����#ɶ�c�O�洪MP�Q�����������w �G�ц�������KQo�k-uH��S�JK� H?�|��}�"U����4���A���Go������%1�u��N���]T�>�;Ӡ�am\��}�{� ����l&,�@'��!``ߏa�w����Ʈzz��Y=��;m��+`^�rk$
yz˘�⽯q��f4"R﫧�d,r+i���q
d�y-�-@x�^�ъ#��r���,]P!����Փ��R.��(s��>Os6�$/ez�]ށ�����\Wlu��������s���3j��}O����%{T.rq>�A6J{��;z�H�1�A���osh�8�-��-D�5mp�{���+�5ȏ��O�e1\�uʏݎ��)Ě"cc���W�i���gݾFm6��K�G+��aU��-�)}D(<94h����$�aH��B��:Z��|�p{�{5��'d��*�����@V�Mo�yc9�?芌�N�ϯ�?ũ�C�W��9�ǐͽ�F���[z�A�n}������6�2��$�S�/���(O���Bc�뤆1č�ɄS�kn���R⨾� *��ue�&.����u��{X��M�gq���mU2���ih
��K�P{��|A�A�0���bQZ�b��0~��fIEe�Ϝ�ew�r���
��8N�wn���v�y�eϲg� �~���d  �_���њ�6��%)J��]�>��]������������F�)n�R�7UzL�U��$M��0P0�> \r����S%0�¿��;X$2 ؎
�e����I �<�g�p*��=��E��`�O��ձ��3�.UZM�r~��D"�N�����r;M-������vATn��`>XH�e6.�oH!��V������� ��dA��@��ѣV ��	.r���	j�yd���Ü��s�t"dr�yQ��'���OP��G��!ɸA��>��V<쵹��!��a�p�d�UV��jD�bv3(>'w�<��>+ڽ�t��z3G_ ��a�}�j��_`�9j������<w=���0*��w����p���F+����<HG�r�s��}��:m2���Iq+�sj"��t��S���
�{-֦�_ �O��r|��d�y@�Y�����ݵ����$d��8�&������쥍Fk����^ec�V@{�G�D�e�4J�s_��o��F+]����*�j�Z�pa�T�mm� �DUq�W��j9p��4��T^�$��q҆n��z*S��f?o�
S�0�J�խ�P��wJp<�;�/+Q�\ ��L��B�*%D��j�o�޾~k�$`=�N(��-n�LJ �F`X��g0!����Ip�'��a��`�np�j��=�&��GPH� *��R=5=yw�ORe��˄\;�8b��J���Ĥ/W%��D6���]��C7*3ڍQt�M�s��dE
AI�W���	d�.^�M��#1:��]���� ��i��~=�t���<�Ql
��P1 +r�4b�?��'*X˟9aՆ��QL̝�g����c�=HNL�3�����s\Y'c�@_�WZ�ZQ�,R?�5�`
ŀl��p�2J�E�D����h܌����2/?I�4$�����PT����n)���zty뢆v��2a�(��~Ȣ�L�ca��W{�fk%rW^�ћ��gsS\;n?35v�,��+ğ��@����P`�1������ZS-��h�T��R�.���	��P�:%�C8V���@���Mq���rL|��T�ԥ�� ��$�/�"�����TM��6([J��/��X]��y����P^��Z>̡@�<�����Ty �>�ga���
�Mon Xip9\)�_��M~�&�id�nyn1�S&�J��i/V�Rt0A^�N%���y�/�M5J�ت�{C�EwA����,9]�H�������2�æ(���M	#�������P�yA�nA���/��!t��`�����j�@F{�|��c��4>w��aG/ڣ%���?V��]�
�W�'����t��?��
d�l�o��l�ք*�c��7/�׀�BkK��u#���!l`P�VK@����(w�h���/c?4K��_�ƫQ��Jm���n��u�Q�8��(;�i�Ę8R����
$@e�4�̳�hP>�/��K�PhϼL�]�Z��9#�4�t2�0�y�+�ku��+#J�oV$��X�]q��սL�G1(��k)y����x!L H���B�%g�b�P<w}��	�E5zKL�9x��c�_[@~����>�L�����*�;���W�a�c�8ey>b��eQ8ֽ[s�
�ヵ� u�\+i�ڤ-��G�D�,�ج��f�D�d��� u�W�i���������u��qZ��4��BN�pq�׼%pg��#Y�	^.2xs��K�V�1_�.�*T��b��㼊���u�����	��:�X���cf�Ց� ���"�<t�'"D�b��ɜiT��G�pC���0�4��3�Uߕ m��5�T�d�����{͎�#Mb{�ȕI����R������	zA�g2]u�� .Bfx�F� �Dj�;݆ *�%�$����gސ0N՝�ϳg��K;�_[���2��CI0CE�a�X�?�P����u�;���<\F��/ -RC�dX�G�[I�*�-�a(>����K�����"Κ�nֈ��]%����mm��=O�Mٯ/e��g��~�d���,K��见�u�����t� ���1���O�@�FG����_���$Òë������R!<�%��b_F/�B@TvP˪w�쎨h�$A��A���nP#Q��X��J�WL���ݰ�x�S�����'�@����p��GU�k;��[���v�\�8]��Fa
lߞ��Đ��s�BS ��h����s8�ܕ��=Xvɚ���X#�S5�+�!���$�xC�PL�7*�S2U�N�R��G�p�7���kY�J1���@���	�SB셳ېUc%v�����a%
V���~=�0nk�\T4�;��rA��1(�bbNPv�<T ����ϊZ���[��i�>T���q1��p�����ʟ�}�7.�k�})iyJ��a痽2�"���+fލ�?����=<fG�S���D�ȸ�s"&�dgT���<%��x��R`�I8`�5����	�R�s��)t=ւ�&5'�Pq!��o��Jﹹ���K),]-��#�wb��6���G��6S��9��,M��-zG�Y��@�q����M��$��Q�{?�"/k.U&��ʄ�Ru����eZ������
��N�4�9OpK,1��I�۫��=�c<��!�?x-�|�X�^���Z��f>s|�V��5��}��ݡf�>V[n�}ڨ
���V�_+�z~�bz�����9��s�99��ԃ�ULl<S P�� �.4B�%�[X	m�i�pc���Ty4�n�����a�*�!"�b�{��u/���QF�����g�A�"2e�������7J�_3$���tRN.��j��Y�~1HhmU
��jDbd�%�`����@[d��q�_n���D��3I�Ѧ�!ڨ0���mot#M���V��ZQ��A?cg��QV���s�/
���qK��bk��}���� �ڦ��Wl����#�V0
u�����-'��u}�.�?�ѯ�֚L�i2��j��uAr��o�:V�o3\�-u�ҋ[�m`�<�!��4��Q#!��~tx���s�[�c���#MwQsbjU��*uB%��r7����gn	��!��#;�Qn�`��.����.�15�+�O��X�{��l���Ca��B�����S��܀��a�&�M�t�4ʦ+"���D���`�d�Z �_���?����Tŗ�IB��F��o�JG��j�p_�Y[#8����
�֍Mo=���޵(i� �W(�S ��[Yh�y\%<�a�ܜ޸]q?��҂���܉����7z��4��~fm�~寙�lQ��~����a�֍���c�M��9�/6^�^���k�͞h)j���Y�J�rиO͈�#��#JSp�s����͐�sr6,O�J��?�tHH؏ʨ��]x"6ɹ)|7�����f�-��S�ԪlЮ&x��=���Wp`dƏ����5�ε�9���2T���s����bɱ�TQ�Q��L���}����	����j���*�����ϬLtvƠ\��[�s�I�
��y�ǱbU�l##�슘�� ��d�8$Lӭ�4A��8�}�:�3K��ej��j����9�E��V�����<fW��K.��G��O�z<��H�OȎy҅���@�p b�q&R$���0 ��Q�D!�1��,��A�ޘ��;5�,ld��P&��BfS�VL���$��|){,Z�B��v�D5�"L�3+�L�@�y����y��J���a^���x�n��<#I3�𝶖�0�Z��i����T������	f��FE�Qrw�0�*�b�ؾf�7��dp�������$�E��Ɏ��G�(����_RT�;�����v�dV3U�;1I�v��x<���j�b��H�����U�(ثc1� �n0Me�X�`�I��ۛEr���+������1 �]�PC�	Ǜ�A��|T�qK��!�� D&�9�SP;'L�'D�a�W���������;��ڨ	�D0Y1Q~
�#��4_�4�j�'��"��B/ZX��+ੂ�I�f�x&�N;Vf 	�ê8wen��������b�~�SW��yT+g�f"\����wy ��/�i{\΅�I��ud%:^`�~���J���k�ڃ���Y��h㘶�L�fq��E�Q3�߃<�W���B5�Z�^[�e�k�se�
�o�`7E��(�n*G/��ϝ��"^ �r�ڳ�4�ۊ��ɢ��L3�u?��iiZq��v6���A�vC�ʭVc���1_�@a����DA����`���$��?���2A6����?
�A�'.��H����p���Kxj����Q8�شb2����JLD�d%�+������6���IP��qk��ڛ��(�V�Z�v�FL�5ad�r����@Y�ڶ��t�^���u�Q��7Ϥ�� ��<��?��,	�_��P�PS�zC�pݽ�׃f�1�mo����n('���	��}�ЀӝB��y\onG?�� �V�ި=k��N�jA?DO> <8cz�U�	��b�Zi[dʤC�K��D�|a�'C+�j�C���^tW�"L�����E�B�o�>D?=
�A��sX�℣��[�A�;XrO/� �u �V����K�N����cO��P��J7/,W��^��7`��ѱ2몏ˣ� ���PS�삦c����î{CB�!� L��՗]��¨�H����D�&����>��=� �[�2$ C�\���΁�S��Q��/P6J����j�����_�l�ϲ�h��b8���	�7��ۄ��,-�z$�*�����~P�{�`L�����q*��\ A'���1��F�n-�W��q�2R�V�i���V6�� ��T����*�ovA�������b���0�2Ş�eE���m�g���li���-Q�K\T���~c&Em���D�Rm�@)����3#QN�/��n�bU�$*TO� �F2lS�� V %;�.�r�*Z�R��=�Ul�9S���?7��ă���$�ƞ���ϥ/�:S,r8]pb�!ѻw�#DlZ�A1��ǰ!���h�ha��W��-6�#_a�h?횲�����䢅ѱ^# �� y�����*I ��r�֣��P�/i�j��w�Ԑy%�� �$ൽ*��`'��,4 �� ޚ+X�S�{�o;�7�rTL���7���t͌~�TS�ڕq(�g_�X�2^w�jH���ܵ�ͱgf�,m���\׸�� �#YV�7���CÅr������sW.]/�[dQ��8Z�ĥ��a�gٰ�j�;������P��3�nL��O�T��F�G@��Ms����G���/Ҕ9A�3C_X�a�3BJ���d?-2>���T���M̅Q.�E��� )j�rR�՛5��+;(ϩ��T�	�w-��X���%��o��z�u���)�}e;i,~�c6'�&�x�=�!˅d٤5#~�=���YF��*(P�:, ��!kDi��z*}A�ri�:8�}�l�I����'�q�~S�9�*[G����N�n��9���L�D����Y��:Ђ�������}�$��Ն�hw���DMǅ2��A�p�Պ����1�`��{U;���v�-�j��KǂY����ś�iP�Q�5:]�f�킼C�2o�g�G���I3�� �s����>�]b�*����F��p/�x<��j��q�ا~#�s�h���gJY��(�'~U���c.xE"+}���=��Rc�����?)a����H{Z�d���M<wMM$���F�Xd��͇-�|U�-��W}p�+�B@rm�G ��&��SdVՙkԮ�I&�����6�\L(m"�m�7\Q��Ct�ؚP5���A<N*�+M772����?���|��%���)�t�SR;�]L�V/�����yU��zLX[���sm��E')�縜
~��Cd�M��ٌ�O����e���������.J 8;��
|�b�!��M��=�T7��S;��d��=!��,�$��K� #sqUבh(���:��N������aY����c���	�8�Z	�����d��e�!�H�k���u_����D�B`�9��n���B��
�Xnɴ]��U�-�d)<�1>4���:dy����Ę����2"f�%��E�*���;���s�K�I�����d�{:�W�������!�۫�PI�����EP=�.�
l�#3'ke�,S}X�xe�:q�Un<���fx�g����	�\�C�/ ʊ ��D]�bRH��7�d��9�e�	� ��;�v;��������g $�aV�s�]���Z�3��"|�����lI�<�0�C�h��`�o��s�ɏ�OI�e����t��b�X#�Cڤ�[�DA�.�f�����8P��K�������dYj�ð�4�3M^}�	�4"�̓}j�^�]^�N� 6��]|﯂0#������/z�⺛$�z��Vpk��qQ"�@� }�éq��ZO5��Ֆ^`x�H��`�ӡrE��^�!$�וi'Sf�p �>\wܝ���$��ԩ:�N�#6����O+T�f�W��kU��v2Y�؂~ҹ�=��N�R!�2���(��GC�ׇ��e�	>+�!���r����̕�ח�d!�?�aᘟ�[���"Tn������3��'ԕ�!�j��TC�[��Mߺ��i���x0H��ݤJ�a�1�F�VSo��.fK�9&gʔ̣H�^!~�,k��,e'A�)���?�x�&ZN ��[��r(`C�"T���|Q#�Ј1����ZB��y+���{���[lܽug�.º�[tY���sIb�o>"��)ws��x�F���e�& ��آ���F5��.>'$��1Y��t�A�	vB���%�#��a?���YB8�C�9�7Ý|C�S�o�l�(�
=�����[k�b$#MED�
�X��ڔ�H��Kض�=iX�������h�b�b&R�ޤXb8b�'�>���t����W��o�Ⱥ��+_�d����h�@@�q.4��~�rFE�����:��λ�c�����F����|!̨}�U�"�uQ���ZW��H���ω�Վ��ܧޱ7�X�u�� RH�y�^�Q�n��n���^�k�ƣ��K����s��S�����X�)B����f��{((��Oy��˂��l�	R��t�#`�eǁ�ؓ}�г;Gi�*���)��W)�~V����˓��>`�wRsѷ���2���&�=<⃦_(�nx��-V�G�|�ë��Il�M{i���HJJ�֜����U54��^-�#�M�](k��TX�ۂ�������ϫ�O2SF���I�P��ѻw�/�(|��Kpr�7�@?����c����kۙ(�D	�w6�	�X�RQ'��f�XD�'���f�p[E��vtuAƽv:,�%��\�5�6L%���&��=�yt�xA����e؋
��)u��&vӂ��ԇ���+@BC ���?HJ�A���W4<�)�����5u�{��D8��x�1�p�(�,��b�NJ�q}��j�l��d�$z&�+�'�x��S����1v�o;o�����-��ۇ�Ւm���
���� 힞jzK7ޘ��{��fA3��9!S�U�w���?ww#4|2Q��)�Y�� b�r���^�9u	2����ᎁ
����J��w�'��Ԅ��$�PZA�U�y`�g�0�W;B[�����{C"��`R����9u���N­���؅��DΜ�$��'BmI�Pi!���l��4u�%g�}a��	�SەH�%j {��6����(�H�Q��k{;!6�zf�@��Rd��j�Qv�!��s�O����P��l+��L��Y��_{�\=Ğq{�z�a��E�ZF��#&�fꀦ�r*� �Y��4a��Yb�6@��Lؖ(:Ǆp0��\���VTn4���D{��senRoZ�'M7�P��Y�Iawd��'�#�)N
C��ܧjJ~}7e���T8�|il��