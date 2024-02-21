PGDMP  *    1                |            bababos    16.1 (Debian 16.1-1.pgdg120+1)    16.0 &    E           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            F           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            G           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            H           1262    16388    bababos    DATABASE     r   CREATE DATABASE bababos WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE bababos;
                postgres    false            �            1259    16390    customer    TABLE     �   CREATE TABLE public.customer (
    id character varying(100) NOT NULL,
    address character varying(200),
    city character varying(100),
    state character varying(100)
);
    DROP TABLE public.customer;
       public         heap    postgres    false            �            1259    16544    logs    TABLE     �   CREATE TABLE public.logs (
    id integer NOT NULL,
    customer_id character varying(100),
    sku_id character varying(100),
    price double precision,
    "timestamp" character varying(100)
);
    DROP TABLE public.logs;
       public         heap    postgres    false            �            1259    16543    logs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.logs_id_seq;
       public          postgres    false    224            I           0    0    logs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;
          public          postgres    false    223            �            1259    16408 	   pricelist    TABLE     �   CREATE TABLE public.pricelist (
    supplier_id character varying(100),
    sku_id character varying(100),
    price double precision,
    stock bigint,
    id integer NOT NULL
);
    DROP TABLE public.pricelist;
       public         heap    postgres    false            �            1259    16458    pricelist_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pricelist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.pricelist_id_seq;
       public          postgres    false    217            J           0    0    pricelist_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.pricelist_id_seq OWNED BY public.pricelist.id;
          public          postgres    false    220            �            1259    16419    purchase_order    TABLE     K  CREATE TABLE public.purchase_order (
    customer_id character varying(100),
    order_date date,
    sku_code character varying(100),
    sku_id character varying(100),
    sku_name character varying(100),
    order_qty bigint,
    order_unit character varying(200),
    selling_price double precision,
    id integer NOT NULL
);
 "   DROP TABLE public.purchase_order;
       public         heap    postgres    false            �            1259    16533    purchase_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.purchase_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.purchase_order_id_seq;
       public          postgres    false    219            K           0    0    purchase_order_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.purchase_order_id_seq OWNED BY public.purchase_order.id;
          public          postgres    false    222            �            1259    16411 	   quotation    TABLE     �   CREATE TABLE public.quotation (
    customer_id character varying(100),
    sku_id character varying(100),
    qty bigint,
    unit character varying(100),
    id integer NOT NULL
);
    DROP TABLE public.quotation;
       public         heap    postgres    false            �            1259    16501    quotation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.quotation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.quotation_id_seq;
       public          postgres    false    218            L           0    0    quotation_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.quotation_id_seq OWNED BY public.quotation.id;
          public          postgres    false    221            �            1259    16401    supplier    TABLE     �   CREATE TABLE public.supplier (
    id character varying(100) NOT NULL,
    address character varying(200),
    city character varying(100),
    state character varying(100)
);
    DROP TABLE public.supplier;
       public         heap    postgres    false            �           2604    16547    logs id    DEFAULT     b   ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);
 6   ALTER TABLE public.logs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    16459    pricelist id    DEFAULT     l   ALTER TABLE ONLY public.pricelist ALTER COLUMN id SET DEFAULT nextval('public.pricelist_id_seq'::regclass);
 ;   ALTER TABLE public.pricelist ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    217            �           2604    16534    purchase_order id    DEFAULT     v   ALTER TABLE ONLY public.purchase_order ALTER COLUMN id SET DEFAULT nextval('public.purchase_order_id_seq'::regclass);
 @   ALTER TABLE public.purchase_order ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    219            �           2604    16502    quotation id    DEFAULT     l   ALTER TABLE ONLY public.quotation ALTER COLUMN id SET DEFAULT nextval('public.quotation_id_seq'::regclass);
 ;   ALTER TABLE public.quotation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    218            9          0    16390    customer 
   TABLE DATA           <   COPY public.customer (id, address, city, state) FROM stdin;
    public          postgres    false    215   $)       B          0    16544    logs 
   TABLE DATA           K   COPY public.logs (id, customer_id, sku_id, price, "timestamp") FROM stdin;
    public          postgres    false    224   �)       ;          0    16408 	   pricelist 
   TABLE DATA           J   COPY public.pricelist (supplier_id, sku_id, price, stock, id) FROM stdin;
    public          postgres    false    217   v*       =          0    16419    purchase_order 
   TABLE DATA           �   COPY public.purchase_order (customer_id, order_date, sku_code, sku_id, sku_name, order_qty, order_unit, selling_price, id) FROM stdin;
    public          postgres    false    219   -       <          0    16411 	   quotation 
   TABLE DATA           G   COPY public.quotation (customer_id, sku_id, qty, unit, id) FROM stdin;
    public          postgres    false    218   2       :          0    16401    supplier 
   TABLE DATA           <   COPY public.supplier (id, address, city, state) FROM stdin;
    public          postgres    false    216   3       M           0    0    logs_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.logs_id_seq', 5, true);
          public          postgres    false    223            N           0    0    pricelist_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.pricelist_id_seq', 46, true);
          public          postgres    false    220            O           0    0    purchase_order_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.purchase_order_id_seq', 53, true);
          public          postgres    false    222            P           0    0    quotation_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.quotation_id_seq', 21, true);
          public          postgres    false    221            �           2606    16425    customer customer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    215            �           2606    16549    logs logs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.logs DROP CONSTRAINT logs_pkey;
       public            postgres    false    224            �           2606    16464    pricelist pricelist_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.pricelist
    ADD CONSTRAINT pricelist_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.pricelist DROP CONSTRAINT pricelist_pkey;
       public            postgres    false    217            �           2606    16541 "   purchase_order purchase_order_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.purchase_order DROP CONSTRAINT purchase_order_pkey;
       public            postgres    false    219            �           2606    16507    quotation quotation_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.quotation
    ADD CONSTRAINT quotation_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.quotation DROP CONSTRAINT quotation_pkey;
       public            postgres    false    218            �           2606    16467    supplier supplier_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.supplier DROP CONSTRAINT supplier_pkey;
       public            postgres    false    216            9   �   x�m�A
�0E��)� F�L��Fw�6H��@L(�}Ֆ.������i)
U�BJ��	�Ac����);����
F��hm6�J�h��S~��i��>��{�>"	8����Ѵ�ga�+�ʦ�o��C��o(�6��>^��X�]�Q-�R��2�i�n�u���5眿]\Q~      B   �   x���;
�0�Z{�\`��ǒV���&��������i�H:�_��d���?� ޶T�I
u���MХ��氐P�)��@nK�F6!��t�\��+��19G��Z��?X�Q��5���U�8�Y,L����~¸;�      ;   �  x�m�Mn�0�ל�X�(�H�&E�A�bP7h��9�$'�G�o>P$�׼<]�.�no����򘙙̚K���L���+�����
�	d��46�d�ɨ�P�0ר%EU��+��yy~�����Q2��z}]P<�r}x����Z���'PgQ7N�P_�c�M���s�UZ�e��Vm�0�A!�&����X򰠊z'0g��V$���/�c�����/ʊ.�����YN �!��@��2i��^����YSͪ	��ȶ���1Nj-w5�O�A��Z��Q-޴����,Hg(����'�
�*	OP�37�K�,Z� �D�n��u��j�	adBr���m��*��r����e���j��$�8C(�]��%��_���i��5!`1�1���p�EK�����N��~}_Y�D�������ރ[U�r<'H��8��z[�;D��9I�'\/�w�f��1����,N��	Qz�EN8�ԪNB�qmٹy�X8��|x��D���4�&x�\��8q�!k��JX��D�D���Sv��H�f=3���Qf�pz�zp�W�L����&t�{�Rr�	AC֝�����mD�"U������IR���!1�L���v�����rw�x?	�]�:e;��ϵ���u���d�۽	1��~��.��BJm�      =   �  x����o�6ǟ��B�S�Uy<�z�[$5�n� /{qW�/A���w�)��Eys�D'�}tǻ/��������`�j5p��/k丝ЕF=��Xs����j����W]�7�ջ��t���L�@`��f���J퐉��"Gs8��H��/rD�H@c���&p��8&�7%`�A$�drc��i$���a���Y`8�q���4��fKq��+QT����H��EpN#�&w�Ö'{(zr�KZe�Q�͗y@ɚ�Z����g_?6 ��I�^��W��妚=>_�T7�oˇ
�2��c�3��j���|&:X	̌0�ŧb�T��������7�u��[<f	�88c�=���Re�f�a*���`�d�h�:�8�}�1��e��H��2�`�1(9��90Tؽ�lat�b����H�v��O�@���߶��dT!��	}}س��)��A�`H��"���tǰ���D�l��}��C�1���U��S���B��j��;!��Xh�}M�S��Q%�=@U�FE�,�j�ͺDe��ńa�:�`�| *�i��G����Ѵ��� 5Ւ7Y_\�0΍`����p��`��q���Hխ[BI4�aEy�%P�����e�O0����|��L��틒�J2r\�����!GF ��s��}"���b%�8�i!�� �ocTR���_�]�B�!%Ux��)%hM;ӌI���"�ި����x#�LY޲A�m�7���)�I+b���ѷ��(�c�:��a5$+	����3�td)��-9���P����7�;&q�5�5���B��Cq	��R#�!�I���؞_"��dJ��p�&�~��y�t�IH3,��We���\��
�P�"m�xw^�Z�;��W�{��������JF��v�>$�ˠ��(U�p��e�U���Ǭ�������Ǡ�Z��V�LȖL;�j�ív�~=�1٩	�S���i�+�m$J�9���̝sa��J̤ZJ
Ђ!@gYj6��X�jH-�"(�U���M������禚���7ջ�Ǉ�>����a�V�c���m��%ͮ�Tʛ���5�X�N[�vJ��៧h�H�*����p@]Z�����*h�
M�����;��[��'���T2�Z~͞־�}2�ƃZ��QZ{$Ng��<7�9B!cE(g����X ��"�!�@�uxu�]�R
�$�q�Z��]:����Ť���m�Jɓ_�'''A{?N      <   	  x�m��n� �3y&��@����h��J�^vɤ���0��5��!�o�d���{�ȦW�Q C`f������- X�t���[�������@�~����1�z��= �d2�f�hȌf:��_WE�n#�"�Q���r1�;��׿ph����0����BI�
J��!���tTX(T+%
��*����5�������ɕ�-w�SC�X��?���A TaP��k��Ø�5˒�i�.X����v��g
���y�5�u)U���SUU�Yx�>      :   ,  x��Tю�0|&_�h"� ���K�b����,�r�}2XQ��cBS@t}A��ٙ��/���m���(K'��/,�,-l'*�i�E��Z������rm9�����j)m�l;Ѕ���u2�HKa�	"ҍ�w��;v�<yi=�#�`;MP'�:��.��s���q����,ze��l�Nb֝�^<~A�;MW��_�x�a$���}Z�	ؚ�6u55cڔG蔹���Y�e)���R'�k�-���HVi�t��!VP�	7�ؑ��e����B�=~ƶ�2�C��h�6I��fx�N�
}n'!=M�5���)`z�h�Uz�|�Ȳ��}�&|ň*��D� iK�$�0�O׷�:�8�(��Z�6�5��u��l�#%X��Y]M_E&�VU�W�ln�.��Ӎ�R�E����x��R�J�X8UÅ���N���'�x{[ڜ}�^�ëߠ��Q/�xJ�pRU�g<~���x?oo�����1���Ҵ��q�7S���� ����X�0��R�H���f�c�rj��	U�����9�]�����~�_��l�PN��     