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
�Ɛ�enruan.sh �=�{E���Wńɐtz&	�S�|N�G�{��d���t����q����?XEpe�tQ�SX�T�sw	"�<��\f����½��]�]=��!�3Q���x������v�ԧ-[�6ܹ%��ԋ��fPs���Y3�Xr������D(R����9���izŚ��u�M��^6�'�����Q�)�H��HGc�-�P3�9^j?�E8���Q+�Y,͙�����bIA#���[�+Nɨ����a��s��f�$�L�SA��"oδi	�3A�̊k�I�*��3H%��Cz�<�ۍJ�>�;���D~����Lr���47������JsU����?
�4� �4����e��a��8���6J%�ug�֩��O�3kys�iBN�f�]W/9�&�6�f�'Ο�<�l�3*=�fEf�X+��a@����YU�'q�82<	V*��2���7T��VB/���>���iĊ͠�)ၗqb�L�i��T�mL�L�A�����ߟ�b��4g�0eu��c�]�9d��@��UkhƩ��l6�es���`K��Pg �F����s�Ws'tݨY#��Hɩ�d�]=%��ϴ=W��p�B&�,�I�h���'��4JO�4J7Q�n�I��V:ӭoDp �(T�hh�e���t���
10jBCQ�#�g�Q�X4\ך��0Z�0ms��hX�"-�d]p*eE괳Im�5m�ND� ���KӨӧh�;|� 4�:w�@���vu�}�y����k��w:�.,-�i���Go�~���_���wڷ�Z������?_x�8���;�,{V{�YXZ�f���P�w.�!W�蜿��ӧ��n���ר����Fi� r��O���q�������{ci����7�������\_�wf��yҋ�7��?\�u���tثW���߯|����;_7V7�2�j(E5�X���~�썕�����˝��a ��]�կ�y���۫�.M ��U@LoZ��Adʧh<e2Q��E���0��\U��bU^�T��8%�p�TJ$�x;R)��K��ɒ���*@>��,7Ш���|���1��d�3������a�z�L���+���/��ϼ.I��CY��#-ئ��B�D�X�E�v���i�q)3ku�h�"��Tg �bl��{�p�zѲg�X��Z��T�0`g5��"�"Q���bj�
@�LV���<�bհ à��aCa-Y�3��(]��^F��+�~��3� 2d\bA��F�[�`���FK�n,L � ���9bx�Y�#�F�h�nb��0/R*��$�(d�\:�:ϩ��'�j%L�7>�9p>��d�Z�%J4�4SJ2�SH0��RI.��RH��.�,����lJb&�(�0v�0HW���E�!<��d�	��]8A7�	J���|�����Y9�U��_0�r���Gaq�y*T�<�%�$���w�����?�>�ǡBjv�a?�q�q�K��	�Uw_"�`�J��]`�`�k�^�_0N���n�$�nh�QkR�p��X�K�rإ��� G����.�c?�N^,Mat�<ʂ���b�*등�͂j� h���	�a�)Ŝ[�Ӵe{3S������
6F��d<I����d_<�4�sϵ�|@sр�7K~G���o���3��z:j΋��|���h�׫��#�C�"xH5#b�B�M��q/�@0�@n�[�Ģ`0��1mV�8�Òo�x�b<b�S�K*g�S�c����4��G.�fɨ[(�k����Au�;��� 0�v]�ts��?��myf&�)S؄&���N��sKᳵeU��0�$�	ԘLy\H��so�0!L	�D5w���_!��V�i�b/��m0`5�X�Za�K����yi�ʷ+?]i�ᓥ�{,"522�����#2�Ev������;�DD�=蜿
PW��d~�]�SN�޳� 8��@��D�O��PR�$~��a�hMIb��}��|jP�*N��*+^��Z���4��t�1���f�`�q>��b�:���rp�eC\H<�ı#й��?uĝ I���X�]���8��Z!$�ѻ���~X��ѝ�.w;���*�"�p ��[g���e^!��Wn�A�a̰z�"���g.t��R��<'&l��E}��Oٞ��������Ѭ	Tq�5׺1��\����W��k��GO���Ѹ��w��=ՓH.��6�ʞ�셤a�L�.����P��ѨxI�c	RtI�����ADK����DW̅Z���T��qVРg̺��i��L�&�i[�4h����a�ix�EG����B��Jc �'
�\�����)*��:�I���)J0j���֓Y]�_|�TMo��=gԍ�g����Ѭf�ތVs*�rcٽ\ T����Wq�z�����\˱�m+>�}���k�rȕ���b��C@ R�1 d��0�֪��,B"͝rc8$�K�z����=E˥,n���I�*�(�g���h8���e7L)L�	jd(��H��.�W�!��A�6����1Re���^u�@(���w�D�b�᱆�{��,�'%�Ɏ�!e�����d*;54�΄�?0xơWq\�!O��#�^���N��	-Q;)�zAJ��/��J��(s�	�,�3�$M�+�d��S���$��&���@�,nȧ��X<��F1f�c�+$	��«	�����e�}�ȱcŅ��=��	��VZ���*0��X�n�_g�^�9n�j�p�y��G��Qv�]�t�v�I 7 Gj\��b:�(�\2����A!Լ?�!~f�;9Ѩ����T�<�:�	A����!���><~H�AB��4L2��N�qF�}5���̫��N쏘�y(�%`>Ơ{�I�&\��4<U�S&V(�8��y AX	�I�1�ͩ�����U��"�`���O�
�:��L�)�Yd����qfg;.jQ9EB��Vȍa��v#���KO�?[9��T(wIt�;&9�-AT��9��~p��Bh�J=K���r�'�[��k��>�}�,D+�f�2��劮W]�ï� ���)C�t3D*J��#�^�,�nɨѽ¢eў\L�⴫O��Sz��[�M���X"����!paӎ�����K��	T���j�֧��Ұ��lQ�s)|��M�%i��Yi9E�����E6��ʓI������c^b�:s�]�l%�Ѳ2�KMp:!A18�>$��5`��Ş�h�%�i���Y.Fm����T@��w.&�����F��|�������h�W���%6��'�
�/����ˍu���r�����^|ċ由/��ظ�c��K�����^|2�o�_�\����X��4/>��_���^�:���$�m/~ۋ��ⷽ���^�d�o܋@�/��^������ɖ����m�Xck �}�. _T�?"�ٔ��X��_�!� ��	H^O���G�|�M!)S�#{�B���(I���RM��_%��	Ĉ����ԕq�$G����h�������Z#�5��gʉ�|�gH<���װJ��Ip��Pm�:i�d?ֆ�����(��v�ts�����u���͏5� n���ϟ;��[������8�m|JUa���K<���f`~>���g�՟ը�H|�Q30?�Q���&P�4��?�P�V��vl��6bv��m��	�&�5b~�Íjp���ȣ�j���ՈbYj��g�C��~���`���u~q�j��pmE�fG9]�-���wn��x���V?����{�t����W�W�ܧ�6����������,���>c�ؚ�kl|k�"䳡m2�V���w�>����	�Q�80"��Xb�Dp�O��Ƒ]T���MS���聽���9ϱb]�
��ܙ��V��c�?�2%��X����dO�L�T�����6�=�[Py}�P^
Y���l=�
�����m嵭���׶��*ʫ�#v*��Zn�Q���*�Tl�%'KXz*
���jm�	�����&����57�J�(����K���C�Xj����=�G��XdT�Ȯ ��P8-�A�c� ��lюH�t�b���2�$Hҏ���g���4�I�7't}VJ#�'h�s�gQ9�DhO�r@�bّ&�g ͖(��{y�ʚ�nczPZ�����o���>����
�Q�7����^�i�b}#�G����7IY.�>���H��:�7�Ɇ���H��;��i��+�|�*Iw�ɗ�6�8�n­�F�I�Ϛ�{����P�K�(ɬ�(����zk��`�^5�̮�)
�dB&;.�u)�?�noȜO��**�N�q��:��TU�8o���<�])�r�'��h(OnH�1�8F���%,�b}H�gG�%�j�k|
o�����L(͌�nZb:�@��bA���ڛ|�'�8O���D?��A)B7w7�����v}e*c���L��P~f���+�]�mS�BN&d�۬�Aީ�o�j �e�w���L,]چu$$��:����2
)e�����b��i	L�w���)�9܌�;��} ��z����o٩���>����w؁����7�5J�x�Q�u%_�;���#�?��=��E0׶ �%��O��¾���s쓮��4� L/?�"�P"�re�I�ы��H,�BD�T2�w�Q�����`�k��2@O���ڈ0�@���g�9v�eN����64R*M0�hM�M�����㱍�k���K�Yb�Iϻia�d0W�����k��V�ۂ�k0�PSY(�?C����I�{p��zM���ʵ��>%�:���q��A����>ShD�+���eg�jߺ�����Go��5��6{l;<U�.�)��U��A�����W��ۥJ+-st(�s��J�#b.=8���%��%�ܛȏG��I�jR�-��h��(�!��aOb
i����e$�̾8��ܠvX��J�Us���2�rZ�g�VTg�ň�՗VjB���ژq�VS[�,#.[�ڂ&���R�'0gno��
��(Q�Hi�q+l��^��Q�y&܌��ƁI%r�rr~�k\]M3I�o�J��aʹ����������ZcsM��lQm*i���K��	�lV��8�Çk�<K4&�<��x�}��	�wA[h��|�J&�u�u����8��Mm�TsH�*�������BDn�յ�P�
Ը�=��z\]��	=���(���E�zK8��n��k�	�E�O���R���^<r�h>]Ȏ�Mf��g����"��F��Q&]��K�+q���t���[���=#{D8~�,�`q����A���ѿ���ę�uc>tH�V7+��#�\��O&k�u���ge5i��]>r��t����|�Y���o/�|vv�����-����_���9;�Vo^�|�)��|����ܹue��7�'į������o.�<;22"t���1hk�gW~:���>����w>�c��E��a��˷����|�z��è��E�p7�d���/\d��wk�;������@U(���xnb��H5�t�kd��qȱ�����S�$7���݆g�c7p�uf��tê�5�uA�Y�NN\��]���t��$d��W�=7�_fK%�
D9����wJ@\������ki���bIW����Uo�g������&�ar�B�rL�s�r����t����G�ּ�"�P���^����P�jb~��Y7�eD1En��]r+�
)H{N=Vʄ�8θ�$�\m�Y1j5�8-�������e��."]���#�@��ٝs$2Q-y���|R�b� Y��h+V2z��(]c ����r3s+鍧�~�E��7�1JU"���6���R(W#��R����ȱ�zQ.�M�;�B
�D���m��X`����ѧ� D��WR��W
�= ��I��4V2�����ȁV�3��J+մZ#�\i}�z�`#�ho���K��aC��]BOh�fh�f��ZBc=|<�V�r�Ì����eY�B��5&������u��c�׵AL���^�,7D]Y����0�si����sߵo�ڰ}��(Ͱ[��彝k_�8���{�k!��\�u��v�u����)FfS-$��{Ӿ��ʙ7��?X�� �����]���e	���}i�GDE�V��--A}�&>�ф�h�8K��C�:�v$����k�˻�8����>E�FFh4�,g�xˋ�q�OD�_":�LK3�2=B�zG8f5 �`l�`c�g��U�s�W��H��_�wom]�]ݳ 	�'��鮮�֭[w�K�櫏?�^[��Mvo�cZ;9ۏ�{�������_�>=G�W�xb����Ҽ�_���V� ��=q����	G������3˳G)��B���ӎ�o��I(�_�$u����?�fIr�/�$��c$<�]����<r���\>{ם���F����J���p�z���>���S��V��l$�̽~	������/G�c����&��3�k����ﳙH�9y���������`L	�k��dv4�.۽�x��m(��_�A���{;�I3�¼!$����o�Fa_�Kb$7����Q�KĒ۷�lS�Y��u�|1-�~�3$��ۅ�I|�΁\9Ө�.�SN�g�����g��L�sFY��h�N���Z�������>S���.���ǫ�0���Aй[�c�={D;=��Z���>B�;��, �����N�_9
(�x���9;z����mj��4X��ǿ��p�,}�y/��� '��ٗKW>�z�r�?�����//|_��l��Ƒ��o��`ӂˉ�!��ID/���̽��a��ivAV���dx0b��"����N�}����Ry�]v m�c�}(�V�۽|�z�0��$�Nޯ͟��~M��s�j���>�잙[����;�]�׭)�J�
����j8��eL����M����P�߾��Iur�.�s_ Πz:]�໥o����>��re�	�)J����y4�v�޿���b*oAB�0FC����z���GWa-b2ѐ�,��J���'�?� ��䍃;O�._;��{:���Ϗ���^{t����JE^�]:����9Pc;��c��5V�e�
�#y�8VO�iv�.@�\�VK��Ё����;�~C�������F!xs/NP!��V@�B���>k$N���l%�zH�����*����Sk��K�2x#�yJs��^�d:�Lii������	w�Kf{����FlM��p�>�d�v�}�x�E|ҜS�O�⢄�lVd>���ڍ�z�-�G<��lPف�%�}xXI~��F��nԾ������v��%K�xX]\���2s'g����VԾ�?]p��f雏(��	tC9�@雿J�*��V���O�Rl��E�+�]�43�:�,Ȟ~�a��*����** �S��z��(-H�}��[������^��r"�ш �O_l�1+�o���_$1�s�㏚.
`�ק�U�}��Ā���Rt�}xB�ߠ�Y�$ܿ`��h6�GW[�O'��^��ʍ��'�o(�����>��7�f�"+r�;{Qh�Yg�t%3ngG���ҟ
v]\�����<K���ӎP�v&�hr����V�m��Ub �:錭�K�C����@3�}��h���|}J�`bƗl�C/hɵ�x�>�p_<�?�
���z�5 ^�C��<���<��?�aoP����6�i�����t8t9�?��S��-�����܋�$�8(N �|z���p$
74>w�lF� �)����D~���_o1���ޜ��Ζ��+yg��<Ȉ�I��Ђ�H��SSS���C��A<oW��)���0N|K@�_��<=y���G��n~��`v�,���4���^�f�iM�q��wN+�ؙ͌M���a;�� h��­x��u2Ľ�O���@��S����&�F���f*��X�C��r,���g+�t��+�ʇ��V��r�3i#�Ֆ���q���Ē�w�#��.f�y�j��4�j��f��/+�uȮ��CT�U_��G���uW���k�ؕ~B�7-t�h`�u��.�,�j�ᒭ� 7�.P��<́wu�%�
`</jLT;S<"�e���U�����R��ȵ�� ��N �!F����ƏU]�
7���NT��H�K�[�,/|X���p��ƥ�?�߯���Q�50ZC�X����`EB#��*M�E���g;���E�OJY`�c��!�������)<�e'=��߶� m(M"�*v�"1���&p��ޅ}}m�`�|	o��,����}�D�/� `o��ӵ����6��磛�{�W�%u�q�u��C��'���z��G}�H��YHl�4͗�S}��=*�K�DʌN9ub�܏�M'�����}X8�L�8�S�B'hPf����`��Y�{��ͨ�"Y{4���E�.d��V`��E�=S��m���uפ��.BӚ����xe
)y�-��h�i��^��[�`LI(�0���'d��lz���߱��Ӫ^F �F�ܗ��1��{�����z�J���^Ͱ�SFqj�X�fx�g����y��+�܂{�F�\�Gɋ�H�j:aT>ˬ�}N��L'��v�i/�,��S#�+�̘���Kˏ�:c�9)v�J�#�:h��`�	a�_��P2�' K����&Dd��$G��S6��#�	=>���A�Y����y�u4x�5p}m��V��y�;|G�F�5.�{	���ȱ+�r-^��j���6@�ǆe�h^`�9�P��$d�w�X�. �����J����،�v��ڡo�g��K"��T+�u�Ǉ�}O<n�����U6���̈r��^>;�4�R=�Ėy�0��В���͢8��Nw�/�>)��ǎr�L�\�a]: ��<�|�X3�?�bS�1�CW�EG�2���]�;ljm0o�a`��Dՠ�t&Oq�XB�BCB��ey��r�#'4��S�ݫ94G�x�Ty���q�ӌ�')�(f���~���r�?��G�:�+a�k<�WF���2[����z�<�?ˉ�Hm�h�O,��k���3'�޼�4՗���W�V����!1n�`�v�A�C����g�d.-�g�̻֭��:�L	X��K�	��Hd�#�~ys�%0*�Z�����Cw���	��hz�0O+�S)O��|[@���j�#N�/-^p��r��.�Y�v�bg��h�]�0����d˽[;y�c�ؘ�Wg���]����{��P�R�*m�����3�ލ�ٓ��������|#����>{�G#��#l��=���C�R��{󣠦>mpd��<��9���JuO��¸�}#���֡��y<�}N�y)x��u�&��o��0�R�_�ߥ4F�g��WnF��w�n��{7��>A�M�,����`��9���MN��,�X��45V��A85�V�P���V7�`�E���;e�:����%ܧM�IX�&�r>��C�8�.K*�an���i�a|w�-��s��FgQ�K<���ט�A�J��x�W�=��G�J�a����J+Qs��)����V>Mh3l՝ew��ˈe�q':v��A��d'�S<��ݿ�殩���b��|/��re��K �e�k�μ��7$�\x������ZW���1C�o�
�T�TeA����D��6�c��`	�y�t��9%�a�]9���i�E4�q��S�"����( l�����A�,��M�����Z�}X|"S*�93���Opvf"]N�,��i<��+���;$��<h����X���Uc<�ذ�}jj�OLVqꈶ�G[ݩ`�����.2�
���le�ʍA��s��g_���i�����7N���	O�|��������V(� ���SЛjޱ�,QӮ�v�<�ilF���U�^1/��p{�����������������7
��f����t~��������U��ކ���Ս���n_�)4.��g�b��TG��`x7-#�[c�ܗ��Y���nzx�d�T<h���=l8�~��t6E���W��AQ��6hv����<�gbכ^�&57D�-��hצ��/��-��h�tЂ���p�iyR��E\��z��.q�V{gw�!���^-�އ��R��a
�D<(�N��e��(��`��l����z/p��&O�U"��5�T�gZ�s����|���^��(��F��31TIO`$6�����K������v1����([3V:�8���ڛ���P�G��a� �n!�Y�w�qS�K뗗+V�Ρ%o��7�L�Qd�x�D��]0�FD�Ӎv�!�^�:�2F0�dO̧�����ϋ�}�Z�t.���Z���.���d�L��{�C	�Lz[�����y��g4�6�;V5�Cu�7����i9��l8����ܔm�t��}���oi�����t�ĶIl�ĶIl��*$6"]��Gș溭2��u�}��<�Bb�?)�'���ZL�铠�"��=2�to*H*"[�i#�3��z���:�5B�E��#/��`-��!��\���!^L@zxX��k�g�R���"|=ע�o����x��������Ɂ�l�m�Z�F>������H�H��HD
���sZ�LP�R9-���l�lg*��!�
&��<�DVaF�j��r������9n����j��f����Q&��[��z�-��4}Z~�Bߖ��xr�|Ξ�����A�û��>��y�@�K�Ӱh�ԏ������T��*����L��
n��m`c�.tg�����	o���E�y��-+���M&���&��J3:��b�K�Чs�<�#�*IЍ�i��Jq��*{C��Ej�P}�{����3.mj��H;- &i#�>t��[�&b]4ݶaE��uz����I���2Y��}��x쭉>�9�(�|#�BR��0�5�����Z�	+�=� ����[�j}����b����؃V��H��5s�J�Ƥ�<Y,����Y� �̫@#��в	��-?>�|�tDȿ�ߋ���X0��g1��Ͼ�q�;����jG>w��a��']��dưE�³���1�����������2�P5͖qZ5De�@�l��ʈ���ݾQ{n�`�U����r���V�8�r��θ��Ծ��\K�1q����^�B�=z����{��Гٽ���Vfg��t�����b����J�ޫ䏃�-�~�Գ\Hc�L-'𶷗� :䊂	
�j��ӝ�P�s"�[�+�墦�
TEy�%�u���H�	O��<i��:_;��]����h!��N�SJ=~ 7�o���*k�/`a���	Eb� �-7�Z����g�Wjn1r���箰,�(^h]�$�4ae|y�Xw�}��b(���6���ɕk���
7�ݱF d��=lmS�U�f2�Aj�RlP�@K���sB(ҵ��*������m��}�������W�x��p�1�^:V�O�3��lnT����	�#��#��r{�7�Ԏ~��.T�\���w����]�9������ k:�ڏu���r��ޭ^���ڴ�׶d�z�nX������l�<�Z�Z��|D�Ru�jvC��հ1d%��u�5�ľ��[�j��5��w�}��>@���٥�)"²dQd_2�L�P(e�|,���°j?�I�$���6!�GX�?���-�U���2���������K��/X"H"�MX+E���]V�Z������F 6����+���#yZ�^N,=��Cr&p=��ɵ��RY�I�`���G4C�@��w��'K��nw�����{����� ������o�Yj��� Ŋ��x�_c�	�/W�Y��'�+�����f�R^C��d��}�����S;6�cЃ�ƍ�n�Z,�>��M���EQi�ek`���7���Ľ�U�Z����+����g�n�� T䕻.�V�2AK�,ēX����ː��"��C�c�Wm�K�T�RoU�%;@���C�����ѿ�'"j3x�����篭����� \��?���KV.�ծ<`���/��;�uQ�nn����kM.����ˤ9-�Hŵ���Mx{*tQu	���&◿�G�~���&?��
���:^s-MFF:��`Q�2�|��9���������'e�`
��B�L�"���]�4��U��B���f!�9Q��)k���Ue�\��`���z���zc�sv;��} 6�����ȓ>�t,�C23
E>Vt;�S�`���%���lK�	�%~��-[ȭ��H�{pm�:��g�!V�"��E
"+=���}�[����
s�A	1WT�)��I�j��d;��|�-�:|��>�۰�H\]g˲xHx�NZ�����:~ە�Rv��2�ȋ�Y]H{XKk0.�l�1fM���R[�~��ka�VQ�m6�U����S�1m�wL�w��۩ W9��1F�C�1b��	��`�!i)��{O����t������TZ��������x�6���lnZ\�ɐ�X����T*1=�I_f�p&�9�r�D/I���)�Wwg��x<�<�����s��K�_�x�yw�����DO����@x��Et�!o�z�#�({��=�E�pSMC�UӢ	��D�*��hs�6+��k$a���V[?��ϴ�3m�̳���_K:��F�r5�4�ݙ���w]�V��{,<⹕�����j�VS4j(m�-�<��:i6��u����t%�Ma��%Jlt�Mi�)vZ��Ms������B���x5�a��hdx�{m�H��N���'�i����ϝQ�G����f7�WZ h3�$����>�Ô�x�v �s�na�}M�5�r���N�c�
�h��g��B|7r�&`���
 ٚ�U��]�f۵�ة��`a(U��u�XDE�Pڊ�x4;b�(�|R�#z�z��I/�~���3����voy��r�j`?�qެ�Ϡ�L<)��^�]OG�8�y�9�
�]x�;����a��R���}��ύ�AL�!��,T�=�2H���[�>�
p�>�^}�7��/��(�]���ݣ7�����g��=qu��u^R���E�EA=6[H��Ϭ�k�$/�� F��؃Ͼ�d)��Q�K#F7��Z�n��m�� ��c	2��7,�=�������4�J�ן��7��M V� �9!�߿a�?�m��OF���$�|zD �A��T���>��ҷ����N<|^�C��A`?��Ap�;8��Sl՗��>mB����t`��NT|�ø�Ɂ�-��@�>��γ�
�V�3��h(m�-�<��(E�P���Ԗ��R[BjKHm	�-!�4$$Sҥ�1�m�ms����4��t�RR#S���@��Tc�J>���Ku2i�������b���d�C������w��@�_�څ�H�T*�L����:a��֍H�c�����ap�^o=��ڍ�%��;.��]4�O��ᷡ�R4!as+�N	��9�8�n/b��2*��G��b��җ�]p�X^x��]`h?.B��E�D�9;q��*=�/����D_����q����`C���d۶�9-��g���u�,�HY}�����uK�� ���� T%6��d��]�P�X���H��Ï�������É\#�	�Bw���т?c��L T
фş&b/�݃�����fX�l�%�ؾ}`�٧���q;���n��
�k4��(J�{`�ϛ���>�'������:m��f�&�`U0z�Y��O�|V9H؀^������Z�"��˚�)N^ޜ�wOF����鿸��O���)�3�R�Lz��s�^z�p�ݹ�����3�Sꋉ�ĹR���uk�6�#��%��L���2�>�4��t�ҍ���_�J'��(�;|���OgKSN)��	��9z�D!jq��ehlc"�j`�F���7b	pB߆�߁��Ĭ�b^ʱ����a�27y����Wj�y"Y}tc��-]=���g�>�?�wa�r/��A��s2�d����qQ���.,ڙ}��	H&� ؚ��հ3$K${"�w��ǿqO�` �I���3����JD�"*��� �v5�b8�"9"Q���J�7ȱ,��r�D��jɫ�:��[G0j�h�a-�ָ�*�\���Q�:�GWWq�}�C8:D2"q�.�D�� ���]�l��Hy�h:��"����CO��_�<�
ݳ�o���á)�Kc�\mv��n4�I<����ήA�c�7�Ah�!��an�۞��Y?�.�}�MW�Or&C.B�#z��Dm&���;}ףҥv;*���}��z2H���!;C٤�6��@�8��))-���(�"�<1��dxd`�<���9����Ճs>� ��**���A�e�Ē3��ȫw�� Xw訓QW!fVH��BJ&�]�uϝ�޻Ю�;���W��_���=E;�.κ_�h�B�ق�y֛#�<�[�s���gf�U���ร�k�n����C�J���ݪ1��h����� 1���WEN��h*B��d.�%"��t[��sc�pf���]sQ8�fZ�����c��K�{GW.^�Ya桳��)4���n�Nܭ>�V;��V�k I��NV>��ʟ}�r�ﵳh��}�%���(`��l��	��Wh�9}��V)緾F����N33�>��{��bFWq�0�?���ׁ	Z9>'/'*1�E*��/�)!$� =\:��1��x7B�@f��G��z)�7�I����	��l����j ��{	+��
�ifn�`�B�;4~B�P�#��,�C)c�yH�B3J�W�
=� WH'�yx;1Y���O�}�/�9�nۈ߽���K�0d/]�H	��Dq���P$%{����	�{�7G�)���äȥ�X(�y"	R���@��ąb<pfT7��ś���&�|�)��G_?[�Z��*T[@�D��;ţ�j��֐j#�6 ��0�J�_�m��(ڭ7��݆~7.���d�[p���«P��g�v�ɯ�P7�m�NAD��Y"ۡ6��шHL�~N�bh=�->X�Q>�~�}U)���(��<�r�}J�;��n��f흥��hԁ�pw��kFU�:���j�J�	�v=2�����(�+v�ɕ�h���"̻��d��p7�%�g���e�H�Jރ��!�cl�A;C����~��ico��v��>>�{�qc�pl���ܜ[Haeix�� p�����a�w�?����k��Q�_ިf]�2+�i�z�ᴋz�ǟ�7?�2�$�X�yw�кڇ'jW>3?6�pX`i^:yrp{��$�����C0�w�ot�TB�H6]���2 ��<l	�j�1%^,U^�v�L�9����'�x/��^�ُŉX����`8��g��O��ъ]VgJ4=Q/4ȃ/w	���R�M'�����wص��?�^(�^�F��8�'o
�����b�����#[�����;�D��|�6yA�K���+� �X�Tu�ʜ�6�j}	3X���ڧ�X�� �3f���9���*���E!�P�KSc�ɑ�ڀ�{x������y��L��voN��^�����hM`�S��Վ�m#\A��<�73�?����NGޮ��X�N����9�/p�,��H���Y�y��Mt�2{i��q�z�6��䥁�������ɬ�'ޗ�`���8�7��r�3Iϭ�c�"��r|jj*��+ �L�����n����26h�ľ���8<���
�՛�csؼ:�1�U���������˥RŃ�#v&�P�ؙI�`81�R.�بv�eE��-t�U�2�A�S�7�3=fs]:F�o  �@���Ts�p��w������,f�� ���g�9��=�o*[��[&�u��x{�d�x�^�ց�P�g��e��S�U��*NQP7�8M�I.N�+$2R�Gd�?�6B�g9�aV�l~���~�c
�ZBVx���J�RF��X�Ls��G$rJ�Hus\�����������/����U��]L�<l�֕t̹sw�2�tu�!�pP�CK�\H��cߚQ% U]���lR���o���YT���z�n��hp�(�j�W�V�b-.������KD���Y�<2+��,�c�%B@t�l:��Ћ�)>�ꇱi�� ?`e>�LPW$0֍��nq��"�-U�����ϒ�)N��e��Z^k�WY��E=C3�� ��v}�Eo�'H����:�_bi��氐,�o��w�����ؾ�nk�Y�W����z�Ȥ�y��s 	֠\z7�WfbD-�@ʶ���8e)	��}0omL�0�m��/n�\�P
(��t~���/$��Kl�y����k�w��"L|3��JJ�j\�Hv,u.S�L�=�l��H�J�e��8�Xy"�#a����)����
Ro@�0r<.!���͗�R�K�<Q>;��ݬ��)�T o�He�˥��ꦰ���Q�AH�FFl��$6����A6�Z�QD(��5m����kM8��h�k��Y����MhJ
&?r�^���O��/'s�JOVJ�h�70*������{��cZ9Ԓp¦y:�'�W̱vx��_���.ea�v��o度oY�_�o�FV��[,;I��u�Y�E�޲�&�uV���Ǔ�e�{:Y�}|�v�x�ꢻ8�J�L�{ꪻp�v�><�>�K��rve46Q�J�o�#"�@�6�8�^".gev�D� �����U�E��-���ݯ����Y����?��~0H������D�{/r����^��v@��i��)/�!��z�o~7���K�r�v��k ]|� ���~  ���^�ɤ'l�'�UYR~��o���Վ�ׂ��������:M���'G|�_1T>�R��jF�����U��Vb����x��ܝ��F��W{Z���OR�;�D�)���A7�6K���0/~eu�  ����ސ�-x��������F�D�Aœ)��5��i}nMYj0��I����*�Iӄ&���ڑo�{��L���8^0���^�M�ŷ-р��uI�@�6�B�%�?���VjU"�B��N	����}�LL	,�׳�l����j���@N'l�/pqKE������
�&�w8���Yƫ���qZЯrD�w*���WYV Y�+"��ƂH�5��۟B��ȼ�� ����A���r`ab�Gp&$wР���MR&ܤR�M{W�۸��V��kk���H��'����y����,�WKk7h����3�$K�Z�]2Q��������ד E�;��0
��!	j`����$$��:: -��";(��C@e�j ���� (���js���9T6E@eS+P����B����qQ�Q�,]�`<�ɞ�V&af���c��VOh!ꄶ_�S�B4%h?
���2�	�����Ӈ�uy4��o+L-��K�s
���s�=��Ԗ�/M !�H��Uwn���K�ֱ��W��F�:Z��]�]~\;�9KfV��m����{�;�����N:�>�i�lX�U�Ƶ�'�����f��E��GK�}U��ψH���&l���t���]�5%��v������71F�F��CX�{X��N/Y�2�Ս�?�T�.������B3$�chכd�/�j���N�â�����K:����w���	ǁuX}�x��Lvn������eu��ٓo�M0V��2�x.�|�v	�f����e=��V�%����v	o���]��.�m��K���.|~��?%�ɽ�s��ܬ^��o��CYs��;�+��~�̹�{w3W䶇v�C������n{h����TU��ݒ����D�ЎҤ�<���tDzU?�����P�9���v�n;g����˭~������svp'6�svp~?�lu��ٿ�gc�Q�	����'�LP��A}u�&d6�o�S�I�9qO�̦V!��I��.O�U��������m�W5�^eV�<�{U����.o�}��=�H�s�>�i��R&��uBuǡY��97}%���;gb��m��L$g�&Laj%�ϿR�'��y������S�4%������?6C�$�g�����eV�J�JJ�k��L5�{|�K�|����RH������E# P�1�~?X,O����:��2Ǜ��Q�^�[�P���,`zF4�ݞ�4<)yw ^�s[���T=��|x8N�������ۭ��D`nT��yCR�<�H���t�o��y.�!8i���Y��1T!��J�1���[0�	�;m��R��vت7V��9��uE�a��V��u�!��Zpe��
�hS�e�I_3{GY�}�܆����{4�����,�d�V2�����u�[G��Z�mֵfR^�ve��U���'�RhxYZĤy;N��� �s�g�d.�ẃG�d�/����ڋʥ|*3�/��3��)���JY;ULWrl}n�4<�M�>ۊV^���օ���8�(��I_�㇒mTiߨ�r��t!]�����;&m%�kdbjsۦ��6�t��T�}~�Ƈ�#���9�;�W{�����-z�� i��[��*�i���[G��,f<.nK6�b�6G_{�T����_�9�t�S��+���q����6b�5Z`���a�נ��H�h�6� w��&Q�7ı��1Z��M�UrB�t��k��� F�c��<�\�ҩ�޴���
h��W������<P�7�����js�-p��f�n�*���w�bŻ��B�/�(U�'��-��Q��_J��E���mĎ�Ȃ�ݪ���Jv�;���9>��0*fVw]���~����=�$܊��/US0:B�X]SN��m��`
�R�ъ�A�?�H2�u�ߨ���d-�E���]����5�k@�Q&ﳲ�����0�"���(^��z�,���u݅��� t����;��Єf�ַ�4���3 _z��j��N���r��P��K frk�JX�4^�����oF���b{b��"eT��9��B�r�ɃB��M�Qh]��R��n����54��&l6����X��Z���`��� f��8�1M��:�� ���$��X�<�;C#���ʹbn�J�5������U����o*1^�,�]�&��l��*t?cq��2�ҦNq]Fn����^,Ϸ������K
(���+��Q&6�Mu�q�p���Z�WP��^�Sq���4�V���
�̊���Wd)�Z��<�.��^ %nsmv�B�+l:v%^�kQ�ݮ�����=Ȟ�؞��)���"���V9�)��x���j|,�|�8��K���^�<+ƌ����B)�=ċ�����'f��˖���v������:�G��T�1C���}T�o��h�d�3u�j��{z �|�G	f�R�|�/-uN���#��:oM!ᕛ��D��*�-��"��i�Ǘh�%�`'GP�ڱC>����0����ޝHY�>p� d�虥G�K�ז����)뷹�x�ΓߦKJV�?O��N�?��)Ǆ����f���'I�*����:'��d���deb�B?���H����X(�v�	�?L*���� �Nul��-�ho,ߗI�ˤ�eR�H��[�L��{H�L�u��~�*�kEA����%z��>�r���#���Վ,X��5]�m�-w�5�+=�k�.>pOܩ]����|�a��i��ᔹ�(�����bƾ�������[LKq�ֿg��>��:�i/��B��6�Y����9�������Fv	��F�Q�Z���"��2�L�A���ՇGWf�[:���{����� a�=��]8^}x�؈nC�V:.?>�^��z�����̇�[�%F����N3���&h��Vkپ3��]�\ҳ0C�wn��������4�w_���n�E�������Ұ�!#����P���s���Wȋ�Å�fa�'
cw�܃��q���N��D(P��*�RXフ�555�G��o�wq�����K�&���}D�C�]OO�� i>oI:������U?�R!I��ͱ:��,����~���
��D�g�b����&ЛA c�:t53�|:�=�؋{'h�Cz%G/��	V��O�ve�\��3Ȃ2}JGR����ҭ�cv�.�,���P�u�_��H8�f��8�(WD�;Q�B�C&4��#��+�G|*��ӈ���09�S�׺A������름��[�Q�|M�f�mK;?Qig��7�K�?��8��!�yj���i�'�	�'��0�=z���V��|=�����Czچ�旅���g��nçˏ�cZD��G��܂t<`�q�/��K��&�>��G_7���j�R�it��>�ɴ�C���Ŋ��Z�n�{2{��,HמOJ=�Fi�'���"c[dl��m�q#�����/(�mH��Y�P\��4�k���fuvg&�y{��ؔ1��&��������P���X��H>/���4��?��m`����ȯ���˥R�	�O��U��>�Qgț��iy_zb"����)��u�A�&?���dǰ�>�f�N��H���r�8hk����sɻPʒ����\ ��(�O:�8���D�2�%�'Tɗ73��p@��al��m����鹹���f.�>����W�����lRY������sad�1��^��*"�ό�K����Y6(�����剀�/|=WҕI'��N9��g5������%:��|U�q;������+�皖�e����>������D�����Xm�ʃ��`��x�^��F�@?�����k%X����v`}4Z��h5а��M�x(�IZl�9���O.q��dq�|�ΝZ�|�=z���'�����>���U7�bD����0B��&�eW�fb�@����-��߇Y�����]��4V�5-�+��Փ[5��l��������m0��z{����Fܹӵ�'*�wy��ਓI�ak��%Dm}]��}�����vˏ�-_;�t�Nm��eB��ٕ��l�L�g@`	p#����@/q���?�����L�w��Ep2�͠o�'����w��I��a�=��-�7)����S��9+�dy�^�_�]�ν��{�ÿ�XϾ2_�J�tOB�z�I���S��=L�ɧ������YVY���~���#������I�bRj
�ؤSY�9IH[/��"�t���/�mDM��c��??�� 