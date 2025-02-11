PGDMP                      |            Music Streaming Service    16.1    16.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    32783    Music Streaming Service    DATABASE     �   CREATE DATABASE "Music Streaming Service" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 )   DROP DATABASE "Music Streaming Service";
                postgres    false            �            1259    32784    artist    TABLE     �   CREATE TABLE public.artist (
    artist_id integer NOT NULL,
    f_name character varying(20),
    l_name character varying(20),
    email_id character varying(20),
    pwd character varying(20)
);
    DROP TABLE public.artist;
       public         heap    postgres    false            �            1259    32836    devices    TABLE     |   CREATE TABLE public.devices (
    device_id integer NOT NULL,
    user_id integer,
    device_name character varying(20)
);
    DROP TABLE public.devices;
       public         heap    postgres    false            �            1259    32821 	   downloads    TABLE     p   CREATE TABLE public.downloads (
    download_id integer NOT NULL,
    song_id integer,
    device_id integer
);
    DROP TABLE public.downloads;
       public         heap    postgres    false            �            1259    32789    genre    TABLE     p   CREATE TABLE public.genre (
    genre_name character varying(20) NOT NULL,
    about character varying(5000)
);
    DROP TABLE public.genre;
       public         heap    postgres    false            �            1259    32806    songs    TABLE     �   CREATE TABLE public.songs (
    song_id integer NOT NULL,
    artist_id integer,
    genre_name character varying(20),
    song_name character varying(20),
    song_language character varying(20)
);
    DROP TABLE public.songs;
       public         heap    postgres    false            �            1259    32796    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    f_name character varying(20),
    l_name character varying(20),
    email character varying(20),
    pwd character varying(20),
    phone_num character(10)
);
    DROP TABLE public.users;
       public         heap    postgres    false                      0    32784    artist 
   TABLE DATA           J   COPY public.artist (artist_id, f_name, l_name, email_id, pwd) FROM stdin;
    public          postgres    false    215   �                 0    32836    devices 
   TABLE DATA           B   COPY public.devices (device_id, user_id, device_name) FROM stdin;
    public          postgres    false    220   �                 0    32821 	   downloads 
   TABLE DATA           D   COPY public.downloads (download_id, song_id, device_id) FROM stdin;
    public          postgres    false    219                     0    32789    genre 
   TABLE DATA           2   COPY public.genre (genre_name, about) FROM stdin;
    public          postgres    false    216   f                  0    32806    songs 
   TABLE DATA           Y   COPY public.songs (song_id, artist_id, genre_name, song_name, song_language) FROM stdin;
    public          postgres    false    218   #                 0    32796    users 
   TABLE DATA           O   COPY public.users (user_id, f_name, l_name, email, pwd, phone_num) FROM stdin;
    public          postgres    false    217   �#       d           2606    32788    artist artist_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (artist_id);
 <   ALTER TABLE ONLY public.artist DROP CONSTRAINT artist_pkey;
       public            postgres    false    215            n           2606    32840    devices devices_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (device_id);
 >   ALTER TABLE ONLY public.devices DROP CONSTRAINT devices_pkey;
       public            postgres    false    220            l           2606    32825    downloads downloads_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.downloads
    ADD CONSTRAINT downloads_pkey PRIMARY KEY (download_id);
 B   ALTER TABLE ONLY public.downloads DROP CONSTRAINT downloads_pkey;
       public            postgres    false    219            f           2606    32795    genre genre_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_name);
 :   ALTER TABLE ONLY public.genre DROP CONSTRAINT genre_pkey;
       public            postgres    false    216            j           2606    32810    songs songs_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (song_id);
 :   ALTER TABLE ONLY public.songs DROP CONSTRAINT songs_pkey;
       public            postgres    false    218            h           2606    32800    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217            s           2606    32841    devices devices_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 F   ALTER TABLE ONLY public.devices DROP CONSTRAINT devices_user_id_fkey;
       public          postgres    false    217    220    4712            q           2606    32846 "   downloads downloads_device_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.downloads
    ADD CONSTRAINT downloads_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.devices(device_id);
 L   ALTER TABLE ONLY public.downloads DROP CONSTRAINT downloads_device_id_fkey;
       public          postgres    false    219    4718    220            r           2606    32831     downloads downloads_song_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.downloads
    ADD CONSTRAINT downloads_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.songs(song_id);
 J   ALTER TABLE ONLY public.downloads DROP CONSTRAINT downloads_song_id_fkey;
       public          postgres    false    218    4714    219            o           2606    32811    songs songs_artist_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artist(artist_id);
 D   ALTER TABLE ONLY public.songs DROP CONSTRAINT songs_artist_id_fkey;
       public          postgres    false    215    4708    218            p           2606    32816    songs songs_genre_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_genre_name_fkey FOREIGN KEY (genre_name) REFERENCES public.genre(genre_name);
 E   ALTER TABLE ONLY public.songs DROP CONSTRAINT songs_genre_name_fkey;
       public          postgres    false    216    218    4710               �   x�U��j�@���W������K�%�
�n�h�yybf�a��rW���Jj���*�oI�G��/ב��_n#xH�UM}@L�Y���\4�
fk'�G��(=R Ÿi�V�>d`N*G�ж):�rX�=��ERz�swYBNE�K,���X�	�y��&W �V��0�h"�HELr��'�hQ�֛�YJa���6?�{ƫ
!㍲�엋����_�R^�r�4;m��������}�         �   x�3�4��J�,O�+�P�,���K�2Bs,.-V�w�2�4�.�,J�Up�K)��L�2A)	u�2�4��H,�,�g��f�i�閘YU�`h�e�.d�e	�MLN���V(��24�4�t�NDX���� 509�         =   x�˱�0��(���_��6�r'+���,��1e�bSr�cs�å�%\�{���         �  x�]TM��0=O��0���8,+-��+�������ĕ�����<�c@\��M�����,�y���1��|���2�%J���ԑ�\T��]s�ٕ=�yt!L�ݽ�#����=�Pz���(Ӡ�)��/�)p��%�8���oΞ������ʈ�:f�a��-�_��uO�gju��\jA$g˭�|�l��՗��5=	n�|!$34�t]_hp���C��z�a���^����,����I��\&u�~��@�yl}nd�u�P��h�aNWuK�
�ΣVT�V;�y��ûL�D���NG��b)�ީ�!~"��ԥ�7�O��o��Zt����~���ޗ�P�H����VR��:�|bͦ��:-�	�Y�;g������S#)��u�R�&B�)tR���'	�� �z�k}� :TO��vG��b�����t߰]޶�ĶP��,&�hΰ��H��f��y 3��ֆa�lM���� �S1�����Qr��b�P�٤]h-����p�:��Y��9�����|7*�^8L���A�Xaly��ƝG�梴�x��	�������!pc	[���mv� .u��P�L ��uk<�m� :���O6# W�=���jy��_��I�Tt�'��m���?�7��od5k�����rg����-y�����@����m��.�<,<� t�~�����         �   x�M��� E�ӯ����Z���6j\�-�XL���,@���������V-l�sHg4Jg�.�acjYOLx�Iv�$�a�pkVZ"�8�'mr�v��h�^6hbk�	,��w�2᝺������M+�����k���'y�"M�%=}]{�J����~��ߞc���<����nJ��)�k/˲/��\A         5  x�U��N�0E�㏉?�tW@��Z�b3j�x�p�v����-J��ht�������6أ�3Z�� m}@{\��j��N���p�s)$���#�=|h[c�}$�#�jЪm�#u�q�c*�e��\K��Б7�bH�I������S�,�Z1	{]�3�/`��"P�R�<>�<���z�L,J�9Ҧ߉B���`kx�`(Qmκ�5��U���fOZ�P���@���8T��®#؏�=4~��|h��]�q��F����p�9���+x���_ߑ�!�z�3���
dR�1�� �M�     