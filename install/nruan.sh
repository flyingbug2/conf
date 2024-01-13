#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�P��enruan.sh �=kwE���+*�Yq���$숝!�]�B�f�p,�N[j˝H�B���{�#Ob�B2@ �@`���79g��Z��i���zuWwW˲c;aƆ����Uu뾫���ڸii�3��dW�F�1���ۆ�a��-����s{�<�i�|�`�fkI�^5+�n���gi��oxzYo����'��D1�@��_~GJ�hٙ��N�R�X/�)�ۚ����ҤQ:ڟ��FM�U�HJ��tZ�.�U:`��ԭ�3�YAs����p«���r'� ?��ɨ:���z٨�S2fL�5�
m�A�UF4�2�i�W�QC��Ru��=���1�Y�j>�#��M!�P\��D����@����ڸ]5K0��Q/�j��Y9�nm6\@�QjB�u�Q3Ǵ-�+Q���e40�;"$�/�] �W���Ь�D%�i��Ͳ�t�4K%�qP~�:�Ҥ��0C�d�M�L�� y�	hnv;���5Z1���8!`;�Kӎ��lkK�g�5#�C�&��i9.�WKx�y�
�WUw�"�Ü�N]�fx\Ig� G����'Z�aDF���(]B}��>�O��c��@}@�.�}����@��h�؟���:O�޻w��}�,�9e�t`� ��Uv�k�a"	�V��	����l:���=x0���|`.�$���*��sO�n��4�nfX�Lɮid�-!��װ\G��pU �M�Ii��ѧ����(9��(9��$_b�'S��F�J����9)68`�"��"�R���PX\J$�a�7@�u`ߊU��z�	��l��"-��gc��eE�=J��V1,�A� �x��mr]��Q��T��:�7:���:�e�����O_h_�����寖?|��������:?���BT�0�J��7�d��'h<�R#�l{�#z�#��>i�����pUyA���qB$�(t��H��v�R"��*�㬲�ԫ�T�u��5"fh� N^Cوa��L�t�v��w�=8~�u�v�������w�M��gLe�5a�&�L5+E�U��z�&r�8C(�� �D2P�E@��AK6�Q4�	�I9��H�P�k:0�A~�I{�ҼHdb���q]X>(@
j/N3k��v����D�=�3�(P;7�d����v���E�z��ó�*�EF��왗�Y��@E{�|�sK7�/��^��|���ې�|���W�~�C	9ӓ��`3�@�+l�юD�[07R*U�v"A.�����Q��vl>f���0́���&J"<��_%�*�V��j~U�O<:��s�i՛n/�(�>R*��"���"���+�\E�b�ŻL�nx⣂ah�Ɔ"#m���ΩoZg�f�P��	���P,)smc8(���]0���1Hi�00I�i{f��ݰ��h����'�bF�	�R��A��dT2#h�{��4��ٗ-�`�$�W6��#ȸ��F�¬�}	V����ps^?��{�G�r4�ċ�)�)�GY0���@�NeV1��X�`�����H�ݓ��"��4��>������9��
F��c\�5Fo� +�s��k�y_z�A}�=Y�;��{�v�H��M��!cZ$��e?E��G;�^���@&�Cb.$L�F��y�@HD�Ā(��ї[�0�B�D9Y ��QR����3Kw��>������[}�t�sI2���c���~̍���νo��Q��ӗ l��5�3Yoצ3g�f��)ǹ'B����	��WWE���f��)����>^�$�^E�b���m��URH�K�I#����`*�@��-��#	)�Hd�u����{����N_�u��ۭ3�wH�G��S������{�p�ӿ;|�q��g:�������+�yLt.Z+��zW���O����{W���r�1ǈ�dl��:y���-fU#<��Agq����x�������i��׀Uo�0�EjW�<��Jp��I��vX���X�b -B"\�Чy���R<4K#�~�^#�&B�/P�O�Џ8��^|��W_䂪n�'��YӚ� �4�����T٘ЛU����%���%�՘��� F������1S�a�"�=���
u��w��|��1�>Jjش�Aۖ�����^4TO*ID,�/�$`x���G��Ǩx�+S���38���M�H=�|sz�:�"�����f��6���zC/�F#���̦MÝH���ln(����=��q�N�Qo̤�L�2�-�y����[�#��R��;�D�!�.˒� �td �Bf����LB#s���p@�����*��33��K���!?�4���(�g�ƨGA޴������e3�K�$�l��u��pЪ��|>F
�,S�
��|������ex�#j��-t%1Y��\��<#�]Md���T@���0���ZymG1�����O�VH�h�_��p)���xhZ�kM��
\�f�N��W��h�����I��M$P�5j�"]�H�!����aL֠�I�^!I�g^�Uxw&4-����>\�y��Ð_5����'�L�qe+
�0�lp�n�>�[j]w�i�����I�lO;v�(�6�2 *,n �ԸlF t&Q8'�x']܃Z�yo��̦wt�Y���$y�u�9�Dw	��BV�bEٯ��@�Ҁ�3�þ�F��j��3�W58��r�P"�K�|�Aw�)0,��<��S*Rȗ8��y AX	�ͩ����*��`��I0��#pM�q�b>����,�Ih��h8��b;.jQ9EL����a��v-���KK�?�r$�/���(���8����cATk��9��~x��h
K-I���p�G��9BG/�� L����0��X%�D���6@W� `�/@�}�C��!�� "%�}�B�^�,NI���G�eў\L�⤣��cZ��C�$��`,T�c� ��iG��|�ʥ��0*�TX����ƴ�ҰMElQ�s)|��M�%i��Yiϟ�KU��4��G�ʑ�C�9:*����*�N;nٌףee�|$5�Yؿ���8�\,�	���݁9�;����8.�d��r1lK����7�|j��qp!0�FpOv�G6�~h��/ҲVV�Y��,7��'�
�/����ˍu��r���� �����)c^<��v/�#Fߋ�z����j��x�\/>�9b�^|��{��ټ�(��I��.����W��o&Qmy�[^������z�y�v/^ y�^�܏u���cϋ'{V�3 ���� ���W��lif$@ Ʋ)��n���|� ���0��ev<��L�!)U���Z!�$l�|�x@`r���^%���	Đ����ӕQ�87�:�������{����Z#�3�U���ʱ�|�gH<~���4K���q��P-ݜ2X�'k��
���p�Q;��\��N~�ÆU;�!��G|'_�P��O�:@�>��Ug��O�*h�o���C;l��3�������5�?j�W3j�^ց�	�usoa�_��q��Vd�G6"v��lq���MjD����ip��bȣ�i����cYi������~g���W���*?yM�E����	�t}�����7���~c��n\��r����|�Sa�=Z��N�K���^��6�����������+��|�V�1��X��E�gM�2d�����H_5{|�>�&,GqcÈ@�c�1_��u��to�Ee<���4U��+�9������B<�E��!8ȝ	��@���Q,�/�Q*�dY�a8>��#1��n:��7z�̞l��Py]��!��B�o�.[ͮB(���pKym)�-嵥��5�-r,u��w�Sz�d���$�e��,b�I+D
�q4�~ROO�.���ܾ����{5������\a�tm>�=t���-��.zd�|5����
`��cR��:�60�Ζ�LO�/�zн/�I�$�H�Q��IRKB�d�sX�*R�?Lc��x�����Q�`"[,<���`n���T��U��x�֟ZK��ݑ�@G)m�B.](¿!�������\�-�~���g�^������X����q���x�jxK,���`���)W���y�$˗����x{|�qË3�&�j`D�����58
a%�4��Tx�wLt��Z7]��׍23�<��7��ɖ��M
8GOd���|��
�3��q��U׮6kVq�,��y~�D�� O.7�@����"Zq�P�/JX�������O@�>W�� ŏ��P�>,+�4"�t �((��L�ho9���qe�<�����G�y���,�sIN��t�d�e�C�s���E�����Du��M9�S�4�E\LoTl�^
��u���A.�"x�6�y�,,M��u# ��
���42
hd����q�t\�*�d5:�k��7c�F�t�䀯�XX��=;�R�����tu�vvcn�M��{�#;�q�?��ȗ�kp�Hf�>CϞu�ƱLHx����+.��]"���k��L/�K�ŋ���P�\cbt�y�-	����,g�Vr�Y~U��x�H��Ǎ�bz!	��g�Iv�fN��S�2,R*K��`]�I�<�)p�؎���H�$�(1w&���� i2��d��1�5�m+�l��5�E��,ؖ�rǅ+��t�ݎ+��_�"T�9�J0#ߎI�X�4�ʸ`>��1���K7�e1f�j-�jݾ�����M颱�N��>]��qU^�_.�`G��5��r��J
����������v��jIy��yqG��&裁*y�G�樮ob�Xt�zLа'1�4��I˒��cO��a�Q'��^%�/��K̗D9),2f*ͱ:T1dc�Ku�����f�����b�w�-T=�&���O�'�en�ϭ
+�Q�Hi�q��q5�z��dsL8���}J����^���b��_�U���՘eg�
�� ��i����ðĚZX�J�`;hѲ}�.5;]��F���uF��=k�"y���Vy��1��wA[`��d4K�U�u徑c7��Mm	�r@�*�������BDn��P����=��\]�Y=+�MQ�#h�h�uT,� �'�-��GJ�>)��i�[�}���C�d!;44�%B�����Z=��� ���q	��4���Yg����Nz�$�9X�B��w2�t���F�?�����>8;�0���g2��oO&��vՇc�u�g�Q7t?�tμPr����u����g:��X��f��K�|���R��	r:��K�o?c���??��c{�b痷�n�`G�w�_h�k��3�_Nd2��)n���:?���?���:}�����/�:� ��w�|����w��\m]x���sr���.E��{�^ �CqI�hs ����ʨ�߆�^�;�ST]/�+t���p9���q@��^S����tMr��:��o��r�p�l&��W�qǩ�aN؋1Y��ux�U�K�TJ׀2���{w�;�",NX����j�O��9��_e�9��Uc�f�����&�br)�e������W�|x�$��_��Wx�C�/����(~i����T���ˈb�^k�л��K!�_P��r�~΅�a�I�6=n�d�z*�&$��U;Z6�E%�� ByD&���%j%��X��AjC]�X%+�mEJ��e������U ].�b^%�X����mArծ/�7��jDn'-�
l�	�(7M.�D�,������Ѿ}q�%X�B�Hׇ��ݙ�����yW����u�O [�F+��"�՚�+ߴ�_������ȕWA�-�rD�]{UJ�C!�H.�]�*��u�r糯����w@�E� *
躞����؍�"w||<c���٥�^�Ǎ�e���R��-����,��^<�j}w�a�}�8�� �����㝯>or�����E�l�ԏ��F̵7����X����K�O��:���I�I�}�������}��%y=��l����WI��Z�g2fd�N��|r��ֽ��ť;_v޽�:I�G��n��,��t�ZL��t�,�����t����Ňdf)�8o�h����9b]�龲�:�Y����/�f]���̭�η��ц~�����DUo�
�Cl�b�kn�7�,���C�������Zhz�u�<����ҝ����o�n���_q:l�eY2��Di�&m�VBYu�4/�ZB�
�����YN�%�iJH���$4	6)w�Z�_�G�?�/�{�ۜ3sf$����X3g�e�}���<�{�[6��������yi����u���,��i ��{��'�,�<\8{ՈY�w>w����8����x���9�?tɰ'�>w���r���]pO�^�3�]<ru�Wa�7�����0���ް��� g��
_ug�R�����G��rg��Ξ�Z2����2 ���X0�c��_��X���8|��ѝ����)��ܙ��K��#�{_���g�g�D^�ȩ�{��a����?���O������tS���޾�
��}��h �YK@_\<�lq��?�'t������ ,��o�)��dS\�+���w�'��_�rg��	�7�fgg�,�����m�*ña��#=2|*x��t�x(�o\��:�o�ܙ/���T�.|��·�=����?..]��2��o/#�3�H �ؽs0��
B�]X>�[`d����`�Lp��+[\�a��~������ à4~�P�.��?�O�^��n.|���?H�����ĳ��5ҳ@/a�^*E��;����-|\(��)���0����@�lEf�V���������| ���W�0�ɮ��WO�ӟ
��bN��l-7j�3cU{� ���)[�xJ��}�*2L����@�)/�
+_!�h��D�>�w�y�֒�pU�Y�b�f�oURo���f���}r��샂�ԌZN"��7ԛH�������%�f���Z,W�E�(w��O1�u��QԀ��v-0�65>_D�����?��ۊ����\$�9���	P�*�|z���p,b�0mnL�a3.ALa�oy��;�[��z���QZ�h6�	H�kEg��,�N
=ՅfhA|�f����	Cca�7�(�5�.窇�j������+cA�ܓ94�}�b��?w�L'E::|���1
nk�&P��s"6�|6��s9�Y#7J;D�T�m�:1Fd�:���޽�	�a�����1���cT�P����
?��#��U�gsT�K�%�͗
�_�p6\%=@�q�m���2����]�� �;�S˖��"Z�C�; ��6D��i8�˚a�k��{�����ᗸ�6�����^�S���R�MA�l�������j�ᒭ� 7�!P�ް��w5�ے^`<�)�̩�)6xj����J�<|�> (5j��\��(� bTh����UɮI
�:Q�2�3J�?[�9�.%��%��~DՎ_��᣼mp�jo�VVC�pH��ci?*cv�q��������{n�J�v��d;�玾>�"=����dR}۟!H)*�ȵ���H�=�������`��[0z��q��J����?�>m"��ޥhx�������l|]�s��Ɇt{��φ��S+��L�
�j4��W�X�g�*�z�G_����T�S�0�rXԛ�}�·�Ab�j�L���Vsxm�Ҹ���F%���I���RԬ^�6,[�,Pm�+�<n�@y]r�_�@��dKdD�h�j���V�+cDғf&��%�
�w��Z����$�����F? }��n\Je�~����T��Ȧ烙Y�	�|�z,z+�����K�Լ���ɒ{f�=q� �2� /L]Q���P(���:�N2���}�)�jf�͝9g9eƓ-M�_|x��Θ�;[���_wB�/}Mc�r���<�[����y� r{�,l̕��NI�"�L�'���O��g�SG6��"ﺎ&��&��U9r+>sku<Z�����j�]󒽗��;�8vM:�WO?�Wf�9��2�!`��Kvқ"�Q��I��PHb� w+�^��=�����s4ҝ���"C�D��˨��킏߆�݉��V(����#UW���tԈcI}��5����R��̴����c�X���Esi��Qw��j��Y�|0�GJH�L@�T�THG�A�G�<�����i��|@[�c]�9,߃D�R{�@�	�S^�'i�na��X�n��ꄓ'g���r~����0֖RfJ45ѐ����4.��{W��}��:��&�Q#�惜ד7��~³�Y ��Ĺҟ������f�,��O���"Dl��[�2Ŏ�����0�REut��E����TXB���Ǘ�7>Z���Μ�k?&��Wkì�ӳ�ת�v 	3˃��)\�����Z�Ν�%�':�T�\��g���v��Ti��ƒI��m��pZc����A�����6	O@�{�P������aF��~�^]�>^��_�w�N)�c��,v�|�����wRD��b;���w�.����d]w�}T]���ÑIG���P��b��19�3�գC�i�RhN(g�SfV{�N;n�ޤ?���p�A��qA��xU\�<�����߾才�vHz�H�p+���i��	h������ᬊB{4"��r-�Im�aMpP�Q5T�\�5��&tTxI�M��K^����M��a��΄駍�ƃ!�)�ԧQ�Cd�gL�e��It&,pÅ�s�V�D���,���B�8d%
dhh�6�e��$Y=V��t��i����z+�&��V�9�*^�5���^�֬2�-ǟA���3��`�lX�h*�t�+SjFn˄���	����S�k_,\�E��/-]�f�C�>���6۠󐪳/d��/�ǌ¹J�3�{����Ҹ.� ;7��fKȉ�tL����d�nL
[�nQ�L����ۃUC0�ִ�wbb�WL�a���Ra�ŗ��n2ɪ��yL\�*��Av̰����4]Pz��$h$*~��]4�[I]F[ ˪�:`[z�Q����~,Q���u�2�Qd6�f�`�B ����N ���ɨV��.g�m��H偞F�N�ͮ�Y����X?�������l���pט�4��Uc<E��st���=�P�g�&�B@�1&/{����¡��VXӻ����Q��YG~�I���&"o2��K�t��v6
�8&�����:[�@������C�IϗS��������hP*��E�Q3���m���Q�f�	⦯_7C��@���������#|͑��uh#��ب�s�kٱ"l������C'eG��v9W��%��C֔Ղ�����X0����k�yG�^H�%KKI��Wdi��M�H�({9���Z�ʘ4Ǉf�Y˪u찚�چE�8�l��*a���3�)$�I1��2�,B~^n�sTdEl�i��t�凧Ba�B�{���IW`����r<��K�.��?s����X~W���D/g1������(�M�I�_��A�(+˾ ⣛����l�ĶIl�ĶIl��*$6"�D��'����2��B�|QW�z��O3�옞�E`3}T-�u�W���K'���D��C;�r��G���c]]��	=��%���m-�c�CPW��"��ɚ ;4�|�5�3�>1�_������=�h́{u�����*nr`-g�ç�с�����v0�<R�*2m��V(T�R-@�l1�/T�\�R=�U�'�^��
3�6-�&ݦX�d5����}������f�1a�	�uI�"�Aw�%��N�/7�n��^�x����6��Z���V�����Ϙ����=���Ye����1�t:�z�
��7'1����4�N$�m��lnۅz�����>��=:���v�eF/��29<"��_��@iF���uI�t���eDS%��1M��k8�@2oH�Q�p<�t�#�x/�t�ƥM̓�igY�I����]��f��X͓gX��4��A�^���'e�N%��L�J�>+{k���Ο7"_��T!�����JŚ��xf^Fy�X�
y�:����̄VL��������r��A{������]3��,mL����2`Xw�L �7���B��Ф��o/><�x�dDx��߳���X��0f������wܙ9�R��S,�TuS
���{D,<̪Á��e[���/XRwP%�j�U�T��W�c�Ɍ8���������f~���ؘ�{��j�Ξ_���ҧ�b{Ó�Q�=�&�(\�����C摛��ι�>^��+��iiz�=zWw��P=;-���Q��tx�H� ��w���R�V��5���۞����e.w�E=����ޝ9W�y,�~X�k�ղ��
�5^y�Ѐ�V��dj���+<��߁��ԿSͿ��8��`�e�~x�(�`�	��}c��UYK_	Sc7^L8k	���nSb�����s�M�Ԍ3Y�R�1��},���@���?���cy�d�$� K�Ǘ.߉J���~Ǜ��b�еMV�"�9ɀ&�ej�A�-8ҦO
%�X�&�C
"�cr�yy��?!�������<f̽,��>��I/U�a)�S��&Ԭ��2���ެ�;�L
�P��cW�9��Qwl�jǅU�ce�S�xj����g��0=��j��0f�v����=H:�����e]3_��\�T��e�n,`�S°U?�Ir*3����ΈA:�«Y|$o��(t����
b�+�RڃͿP\��B|�AU��h¾��1��o�e\q=�F�o��MyY�� �r�':}FI�6�u 2��Cj*p%��eS�V+UN��:"b��������pʝ9����
�˝��=����mV�g�� �^}���I��=��XN}�ri@���;�������ǣ�`������7[2��8Y��-���܀�x��F��)�]���8����N�L��QS6��w�Y�o�C#HY1Vub飇�ݯ�+_��=�p�8����2��gp-�b�-��bp8X���|�ƫ�r�R����;��C�#�r��ڝ9�f���_��kd3���ww�t�ξռ̢��Y,���,�0�8{y�짋ss�L.��c?�7X���L��]� J��}w@������!y����/��KtTw��ȴ�"��ΰB�7����FK�s�'@�N�/5��!qsN~����=�u��5,��������{��ކG�7v�9)��\D"e�@=���<=
bT�_Y� �DU`�+[��8/-��v�Edk�{ʱ8�Ȭ$�Te?��#����޴Z�=��Z���D��hBH5W���c��({ma��0�� e%1�Z<}m�᧪H|�J���þu�S�=D���r��z��1aN���P�=��U�ey��.#�-XRM�#o�/,�SiQ؇�N{�H%��tדgi]p�%C
bY�s������XZd�"����Ԫ]c=$�Cx�������X_7��x<�<�����
���si� �j�]���Г�N{���]�]�7(��yy�KI�D-5/����[`�R���Mg'�֛��d+�k$a��ZϚ3�mL[�V��0�����LJ�F�r5�0˻6=���Ɯz[��������d.]�P����Q[Fy�dҖP�	e��L��|������Ma��^Jt�M)�)FZ��Ms����1ՍB���x5��aa�hx�{m�H��~���ôuxE�穨�c����f��Wa��-l�(a�6����^S�$#�ۡ�Oz��2���0�5A �58�ˡ �#�	S|��s�&,�{=�i^�*!�V�i�rk���Zr�
��Qu�^�AᎥ?TD��H�Gs#&�r��� X�V��z�ƽ�{�O�V�2��se�ūT3���!gU���$�_�^wG�����I�Z�]Po��ľ/+���Qj����� �i��!`S���w��������\@�߽2�C�/��1'�]����'�#W�������Ө{=vi��+�^	l̓O���Pl)!�?��/43�^��V�a c3f��������Q�-��J���?�uд���~�0��X�L�o'4� ~�ͪ�=��� �������'� �w$�vΘFye��
J*�GG���J	xP샿-|��SNL�� ���'� 0�k�"�$�$����c�:%�V�y-e�&���M֒hp� �@��'�0�k�$x;M�T	��L��+7<z����V���+����%jKKmi�--�����Ԗ�����%-���mCo���6����w����Ld�c�
��V�j��~ZMi��e�>b�'�XЊի�g�'ܟ���yZ �@%o�*�|�R͌U�5��*a9׍P�[^���ar��C�FA?xc4��%O�Q��q�t��&�_�mhd�L��z�sN�.g̫��K��ҁjA���$�,|��9w�Ź{��9����3� �7ڱs�L遁��U5�%��}��;3�p�*r�<�G�o�'�I	��[�M����T����k��7��w�[JgP|}�D�*��6&m�u2%�WC#]K�>Y���L�3}ݜ�u��3��/Ї=L�.�s ��M"+��MX�j2�쾽�:�׳}�Ŭ�qX��;�w��)A�s2@�q��l��a���XY"�� ���즆�[�!������봙[�훌�U�����r=�w����0a$6$�c��[��%�G~'�ې���zG 9y~K��%]8t&�'��^�!�{�^�TQ�0U�5���z�=ùwgn�#��;12211D�/&G�K}$>O4,��B�(%��ǎ3Q��[�A%�=�ԭ�uNӍ�����J'���{�ms#g4��L8��'�����B��!����r��+�R�ߊ�������yڀ�Ŵ�3r�5 ��e���'s԰�dj��)�0��¥w~��9#����n�Z����*>'sK6�7�}�jw8�~a���%�@*�Y H��t'���#�x2�A�˜!8��{�*��:�ƞ��V��QA���.�&`��I���a�����b��Q��wwqvГ$S�K^� ���<�oP�E�k����UYX�¿��o}�J��Vq�}�C8BDr"��.�<�� ���������z�l��"����C���_�ԋ
峂o����C�2���P�%��F��h�H<��� �� έY�c���I`�!�7�mR�W�۬C��>�gkٕ\���k��(f3QF�J���nN�ݨt�]���Fzn�U���Qci���p.)���%) 0�1JJ�蹮�,OV�e��|�g��;�&:زF�.f S@�l�A@(��xj*}�.:u6���
�>TH��$������ ��o�Z��+�̱ůީ��]U9�ޟv��@QN���m4I����x���O�0�&ԉ��rG��L[�$z����e��jw�Ɓ����G<B+Dm�/�D&���T�Q����B�KT���s�fa�\�B�� ��� }x���� �?�ᕗ�OX::#�7�U�;��94ۇЋ�Y����������Q���9���{����y�\�Z�H����l��� 5�0!�a�J�i�`�P�F�:��WQ�C���,GB%gֈ��?���$r�+�CPG��G�����lގ�ך�
�3�D
v��/0� k�ޗp_-^>���͜�I�����}膒}F�P�޴��қ#�ц~%�)R�NE�S����^�$I��8�P�	� N�iF#JС{mR)�ۄ�M"<�@`l��@oA�nxB s^B ��I��Lt@�S�L<z�@��T�wl�)�ԯ©A��lD��K�����D��yM0��hiB(��Ì�j�+��4�g�J�C�ڂ9����<T+:!#Ѯ3��h0�>T��N�RF+��f^��%ݥ�� =1o���7W�3^��[d���9�T�o&���.n����f���.��mhߝH�%��0���p�������>�D鴚������̉��� ��/~��Y��G�2/�"9���Y��T�ɰ�
��8xʕ
�����⹓�:_�%\�9,�o�\��h ��q��wyO҉bY=$և0X�㾩Π�$��O���]UgJ45��3�`nE���Zm���PM�wعm��ͥ��|�|��z��O�#%����'��0@6;d���Y�أ֖n��9bs,��)6i���	3X����?�0'��`�_6s��d���T�k?&�������kՌ��K�Ό�!08���)=����<O���nI��\�ĒB�x�H���U��k�jf��Ûc6Fj�l�A�ڹ�׉w��do�3�L�\��'���9+Й����4�K��aPgo cFA^�J�Zjt����&M��x��8����?&�	�8��&&&&E�`�U�1�S1�v���v3g��aH��ˍ�C���Z�)n;6��k�Z�\�AX��.{��NT+��.�
2v.��`���I�@85�;R-���v}!eE��'-t�U�2�A�8����c��\�E���F���	�rQ�E�<
��,���]P���x9�K^�x�^�Ɂ�YaS	Du�(��.��h�5��*$�(6J�(>^��� ͖��*]BAݒ��$�'�<�9F���������E�P����Y���Xd��0��$����<�����8���.�/�2ng$rz��Y�����ߡ2u�����9>��
Yc�`�j|��b=�'�E�ܻ3�̭�W1��Ѓ��S���K�^H�pߚ�% �?�$٬H��/�y�M�(zk��X�i&J�7�J�S�m��m���⻳pa�S�Y�-c�%B@L�,:3k(F��`�ɖe�Q�'4����|�ע�3�tFl��s��r�:�����xi�]5�L�����x�}\�34�ZtI�h7F�P	Q��8�t80⾡��5�ᖆ\j��Ė�o��5t$�Ӽ�Ω^�Y�@�s����Ȥ�u��q(A��I�V����ˀ��H�{8��!%���e᭍q�۷��±�N-����l���i ޜ�u�7����B�[�_ʮ��?�0�-@[ki��Mp#�ԹL8+�
z��B��%Wƫ��q���Xn�#a[�:Wi����zDo@�0r<.!���.V&��K�:V=?X�-ݢ��)T oK�F�����MaS���̃����Il�	g��6@6��3N��P
@�s�:hX)��s�Ѿ�����[�Шe&?
�^���O��/'w�ʎ�*�l�70*������{��cZ�Βp¦E:�'�W.�vx��_�c��Nea�v��o�&oY�_�o�fV��[,;I��u�Y�E�޲G��V���GS�e�:Y�r�~�h��}��L:�<!�K����sw�� ��Y�_�/^�k��J�p��oG/���������pRf�CD�;����߿��詙��������o�8���{�?>�I)zhѻ"��Y�X��D;���4���Ơm�=䷿|��K�rw��k ]|� ���~  �/c���rr�1n;UGT�R�Jlٗڒ�54�ׂ���8�����)�{9#>=�놷� �?6ʘd�"V�Uc��%Z5����C�Vc���y�P��1��x>ҫ;'x ԧ�+zCz���ݫo�ooFU�X�p��N���-m�1#xdǅB�6�6�MoqjG�Y��S�2Qg��x1�R�{�34߶dk���[
�z�����і)Z$pB�o=��3��^ �؄� 1�p�}��M�1�V\�;��u�[�����e�n�Q��}*�b�o�嚗/�
�2�[#5NC2�A5��`W���dw�3%�@�e>��?�
�c�a�&#wΠOl"*�MR�ܤR�M{�Px℟UM��V�ON���y*��"1�]���~�*�� �-k�m�c��7W��5�m!?%b�,&�H�VM>}�A�(�rFPK�D�㍕��'�0`,���ܡ Q�!"�T�@L�xl��VR��!"?���Mˁ�k+:-����)�*�$=�����DB�%}�L��P���Z&ؗ{*KQ���h�/����O�a�W��e��0k��>�xB�-�fRA�L�bqy��#j�y2��5�E�'d�pɝ�����{��Ň�.=��u4U�;}�~�a��?Y���_o`���������w:����ds�0P�̆Uկ^��p�?�l�}�^�xữ�ox���d赢�SR�P��3?��w@k�&fn5���z+�r�p�}���M]�8��/f�Y?v-t����;��m���ݯ���>���S?vӒߟ��K����|c0�8�{�ا�.����e��Ak��i��9������!�wFu�2ƕx�b^:�?V^�]�ȼ����,{���y�{]����Sx�)���v
o;�?uN������4�x?�N�&_υ�s������e�I��T��<�`�{*3�^��͜��>�m���v�G������n�h�}��>�m���v�G������n�h��h����o\��G�̠@d���>*�lTw�G�b�c� �����{�!��njm����$r�KO����'s0[,0*(�Ӻj�\�ȅ��C�Ko6>�B���&����?���3��BC1�)�hJ�Z���bOYsMۧd�oI��W�rl��5���PUt�&���V�?H>���=�a�xL�g�}�K�|����RH�������A� ���~?P��g�=�:��0����Q6]�[V��ǭ,`r���TH�ɻz�������|�CC���P
������auO%cQ%��0�I}��c"�'�������ć�(�!���0�h�(��'o�\)���Q��G��*�~�A�.,�C�}�
�Y��GL��b�	?�v�_D��5Sx�e�g�m�0���QS+n�X�M��BL�j%�ɢ�Z<��TگU{gC'e-_�k�����;���0��s��md�S��8jl�����}�.ㅜ�]��m��[k�vp0j�V�����B���X�x~,S��{)U�v�������Yx�}�-�P�uh[��Q�P-dS��G��ڨ��a'�d��R����[�w\�=�WflbK	ۦ���t��t�}~�鯛�=�c'�Y���l>3������ O�g�:3V�� ���쓚����v=b�i���A��s��� k�,�&1�5����Ũ�ޗ��Ԙ��~�Wh�!��Aj�ǯ��ܩҥ�ִ���-��8��%ց��/�E�s���B��f�[d����>�*��淰|�[�a���ԭ�,��[8��ЈE�D�W����Fl�@��+8�m
���Û���f�R��7�u��c���tC�$ڊ��/�N0BMR�N��l��PYQ4���A[�?I�
�y�ߨ�y��SJֲ1%���(�ڸW֮q�aG���\&�6������%���x���ۧ�^����ݹ;�ݳ g�����;���V�ַ�4���7 _z�����>���j��P��S ej[�JZ�$^���u�oD���b{b��"�\T�њ֦�����A��-�@h]�;B��>����5�����|v�isf���663���e�(f2U��MR��IX*Z���1��Mz4�c�s��m9@z�0ZU�Y��M��k�"c���ؤӔMQ��a,��U�@�R��e����=����ecyq��|Òʇ,�^�uf��(�Ǧظf8E5o˂WP��^�Sq�М0�V�Ȱx�u��3��4Rµ�#�"xz	��I���b�v-Sʖ�#v�����j���0�gs�� ����D>Ǽ"^�t��:�*��7���|�����2�8X�!J>/U��ü*�Ho!�;1;�]�r���K�R�ˑＣ,N��(�y	���E�����#Z���L]��-�m��/Q���w���7�I�V~D�\3�)�:��Fe �%��U��0��!�Jvy<�Z��Ν��k/��C�����z2m�}�pb����#��.�^^8�l�J[�r�Y�H^�V��8��$�k�+&Ǆ�ļѦ���n� )�j��ǩ���T���xml�F?���9Oo��s,��|�Bc|��Sʇ��a*�!@.��Mb�2����}�ҿL)_���,ڭ[��L��{H�����>�*�kEA\ *��%zA�?�r���#�^��3g�Z7�Htٰ!��|��A_�x_c��]�����ะ����^Vy�����N�{f�">}o|-f�{9�p�~�~��$�]���;����`LcC�ˋ�C�8�v6��K�^�_z�"B#��O~+�(�6m�\q�l��&� ���c���,M��p��������ǃp���У~������Ft�ґ��p��Y��?�o�[�����{뷚(&P�2މ`擂�|ұI����K1ɰ����%=3�x綬�����L��xV���PM�_^=�ݡ�7-}J	(B�z		�_h9�b�<:\Ȑh�%�p�0v�d݌�6�_Hw�Y$���R�UJ��������^jD��5��+Ú��/����K�}�v��a7����%�)3�Z���~<�/�-3��ͱ:���,����~j��E -�8�ψ�'��GM�7 &�gu�ja�|�t�{��g����	��y�|���'�?�ڵ�j��� �5��)=I���{1/O���v�L������4�q �0��:�G�2��މ���2�!0�|џ�:�8�S!&��F|襻�������B}.�_�$�=�⎂�k*�0j[�yJ�ţ߸'�.���~�"�d�U�ÓO��O��d<�{�&cB����zį� 1����p~q��*zj~�����t��wL�������,�M�u�r�=��d#�������o�^�_�3���©� #�ՙ�������XQ�_��m�sOl����#i$��(M}��-5��ƶ�ؖ�1(�mL����P\��4�k��fźr��"��JD��H��i4��^u0�'�.^(�$R,&�ى����Ux7��uF�-�K�c��j�R���e��br�y=��4�z�r8%�͎�%��~1%��0�!b���dǰ�^�f�O�H���p�:�kkN�s�rɻTɓm����Z"��0I�;���M�D�<�%L��T��0��tP��a|��m���鹹���f.���>��u����Z���lQY��������9dۑAv!�����i$��Aq]�=����ux�빖��;���v�!�?��&��X/�!D���ʍڹ�(�׏�Y::Ӳ�/��-��A^����$S�$G��j��n� ���������0��a���]+�Z��m�������Z%E����l
�C�(�L�b3�L�0{|�#T$Khdw�����?~���s��#�/Yi�/�A�L,��#$	a�v��aFF��$߽�̜{�=��{z�����#͕�L��Jor����������ﾲ��v���2н��;s�~�C����.Nvr�*lmغ�����?�O~\�r��n����'NܬO�c��f�����Y6E&�3 :��;��ȿ��)�k����,�|[Ygg��f!zn��s���9��O��ݣw�B}�B�lO�,�y&�s�z�|��w�O܋W��z����Uz�{*��N�����=��a�L��uj�W��0��>C��0��&�R�<���66�)�2��h�E6�^����V���������&�O��� 