--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-12-06 11:23:24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4950 (class 1262 OID 16419)
-- Name: Group Project ; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Group Project " WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "Group Project " OWNER TO postgres;

\connect -reuse-previous=on "dbname='Group Project '"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4931 (class 0 OID 16442)
-- Dependencies: 222
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer VALUES (1, 1, 259) ON CONFLICT DO NOTHING;
INSERT INTO public.customer VALUES (2, 5, 109) ON CONFLICT DO NOTHING;
INSERT INTO public.customer VALUES (3, 9, 405) ON CONFLICT DO NOTHING;
INSERT INTO public.customer VALUES (4, 18, 380) ON CONFLICT DO NOTHING;
INSERT INTO public.customer VALUES (5, 19, 278) ON CONFLICT DO NOTHING;
INSERT INTO public.customer VALUES (6, 20, 262) ON CONFLICT DO NOTHING;


--
-- TOC entry 4941 (class 0 OID 16522)
-- Dependencies: 232
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ingredient VALUES (1, 'Romaine Lettuce', 'None') ON CONFLICT DO NOTHING;
INSERT INTO public.ingredient VALUES (2, 'Chicken', 'None') ON CONFLICT DO NOTHING;
INSERT INTO public.ingredient VALUES (3, 'Chocolate', 'Contains Dairy') ON CONFLICT DO NOTHING;
INSERT INTO public.ingredient VALUES (4, 'Parmesan Cheese', 'Contains Dairy') ON CONFLICT DO NOTHING;
INSERT INTO public.ingredient VALUES (5, 'Garlic', 'None') ON CONFLICT DO NOTHING;


--
-- TOC entry 4937 (class 0 OID 16492)
-- Dependencies: 228
-- Data for Name: menuitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.menuitem VALUES (1, 'Caesar Salad', 'Salad with romaine lettuce, croutons, and parmesan', 7.99, 'Appetizer') ON CONFLICT DO NOTHING;
INSERT INTO public.menuitem VALUES (2, 'Grilled Chicken', 'Grilled chicken with sides', 14.99, 'Main Course') ON CONFLICT DO NOTHING;
INSERT INTO public.menuitem VALUES (3, 'Chocolate Cake', 'Rich chocolate cake', 6.99, 'Dessert') ON CONFLICT DO NOTHING;
INSERT INTO public.menuitem VALUES (4, 'Spaghetti Bolognese', 'Spaghetti with meat sauce', 12.99, 'Main Course') ON CONFLICT DO NOTHING;
INSERT INTO public.menuitem VALUES (5, 'Garlic Bread', 'Garlic bread slices', 4.99, 'Appetizer') ON CONFLICT DO NOTHING;


--
-- TOC entry 4942 (class 0 OID 16530)
-- Dependencies: 233
-- Data for Name: menuitem_ingredient; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.menuitem_ingredient VALUES (2, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.menuitem_ingredient VALUES (2, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.menuitem_ingredient VALUES (1, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.menuitem_ingredient VALUES (3, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.menuitem_ingredient VALUES (1, 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 4944 (class 0 OID 16558)
-- Dependencies: 235
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders VALUES (1, 1, 145.41, 'Processing', '2024-05-17 23:41:27', 'Dine-in') ON CONFLICT DO NOTHING;
INSERT INTO public.orders VALUES (2, 2, 65.26, 'Completed', '2024-06-14 23:55:56', 'Dine-in') ON CONFLICT DO NOTHING;
INSERT INTO public.orders VALUES (3, 3, 137.72, 'Completed', '2024-02-26 12:12:28', 'Takeout') ON CONFLICT DO NOTHING;
INSERT INTO public.orders VALUES (4, 4, 69.18, 'Completed', '2023-12-29 02:36:32', 'Delivery') ON CONFLICT DO NOTHING;
INSERT INTO public.orders VALUES (5, 6, 27.95, 'Processing', '2024-09-13 00:00:12', 'Delivery') ON CONFLICT DO NOTHING;


--
-- TOC entry 4935 (class 0 OID 16462)
-- Dependencies: 226
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reservation VALUES (1, 1, '2024-11-01 02:44:55', 6, 'Confirmed', 'None') ON CONFLICT DO NOTHING;
INSERT INTO public.reservation VALUES (2, 2, '2024-10-12 12:49:40', 4, 'Pending', 'Window seat') ON CONFLICT DO NOTHING;
INSERT INTO public.reservation VALUES (4, 4, '2024-11-06 20:51:37', 6, 'Pending', 'Birthday') ON CONFLICT DO NOTHING;
INSERT INTO public.reservation VALUES (5, 6, '2024-10-25 08:05:16', 8, 'Pending', 'Birthday') ON CONFLICT DO NOTHING;
INSERT INTO public.reservation VALUES (3, 3, '2024-11-05 04:59:32', 10, 'Confirmed', 'Birthday') ON CONFLICT DO NOTHING;


--
-- TOC entry 4933 (class 0 OID 16455)
-- Dependencies: 224
-- Data for Name: restauranttable; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.restauranttable VALUES (1, 2, 'Window') ON CONFLICT DO NOTHING;
INSERT INTO public.restauranttable VALUES (2, 4, 'Center') ON CONFLICT DO NOTHING;
INSERT INTO public.restauranttable VALUES (3, 6, 'Patio') ON CONFLICT DO NOTHING;
INSERT INTO public.restauranttable VALUES (4, 8, 'VIP') ON CONFLICT DO NOTHING;
INSERT INTO public.restauranttable VALUES (5, 10, 'Rooftop') ON CONFLICT DO NOTHING;


--
-- TOC entry 4939 (class 0 OID 16501)
-- Dependencies: 230
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.review VALUES (1, 1, 2, 3, 'Average', '2024-10-11 18:19:07.671814') ON CONFLICT DO NOTHING;
INSERT INTO public.review VALUES (2, 2, 1, 5, 'Average', '2024-10-11 18:19:07.671814') ON CONFLICT DO NOTHING;
INSERT INTO public.review VALUES (3, 3, 4, 4, 'Not bad', '2024-10-11 18:19:07.671814') ON CONFLICT DO NOTHING;
INSERT INTO public.review VALUES (4, 4, 3, 1, 'Excellent', '2024-10-11 18:19:07.671814') ON CONFLICT DO NOTHING;
INSERT INTO public.review VALUES (5, 6, 5, 2, 'Could be better', '2024-10-11 18:19:07.671814') ON CONFLICT DO NOTHING;


--
-- TOC entry 4929 (class 0 OID 16430)
-- Dependencies: 220
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.staff VALUES (1, 2, '2019-11-15', 'Manager') ON CONFLICT DO NOTHING;
INSERT INTO public.staff VALUES (2, 3, '2024-08-08', 'Chef') ON CONFLICT DO NOTHING;
INSERT INTO public.staff VALUES (3, 4, '2023-12-26', 'Manager') ON CONFLICT DO NOTHING;
INSERT INTO public.staff VALUES (4, 6, '2020-10-31', 'Waiter') ON CONFLICT DO NOTHING;
INSERT INTO public.staff VALUES (5, 7, '2021-09-17', 'Waiter') ON CONFLICT DO NOTHING;
INSERT INTO public.staff VALUES (6, 8, '2024-10-08', 'Waiter') ON CONFLICT DO NOTHING;
INSERT INTO public.staff VALUES (7, 10, '2022-07-29', 'Waiter') ON CONFLICT DO NOTHING;
INSERT INTO public.staff VALUES (8, 11, '2020-11-26', 'Manager') ON CONFLICT DO NOTHING;
INSERT INTO public.staff VALUES (9, 12, '2023-06-06', 'Chef') ON CONFLICT DO NOTHING;
INSERT INTO public.staff VALUES (10, 13, '2023-07-16', 'Manager') ON CONFLICT DO NOTHING;
INSERT INTO public.staff VALUES (11, 14, '2020-01-05', 'Waiter') ON CONFLICT DO NOTHING;
INSERT INTO public.staff VALUES (12, 15, '2020-08-11', 'Waiter') ON CONFLICT DO NOTHING;
INSERT INTO public.staff VALUES (13, 16, '2023-12-28', 'Waiter') ON CONFLICT DO NOTHING;
INSERT INTO public.staff VALUES (14, 17, '2021-10-11', 'Manager') ON CONFLICT DO NOTHING;


--
-- TOC entry 4927 (class 0 OID 16421)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES ('nixondonald', 1, 'Customer', 'G$0Du$sc&Z', 'garciafelicia@reynolds-cook.com', '1996-03-23') ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES ('ohuynh', 2, 'Staff', '6)1p!NiST&', 'kylereese@hotmail.com', '1999-08-01') ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES ('santosmikayla', 3, 'Staff', '^b6KoHWiyt', 'jacqueline12@sims-mueller.com', '1991-02-24') ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES ('grahamsamantha', 4, 'Staff', '(0I9dWfJXJ', 'aphillips@yahoo.com', '1994-04-02') ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES ('daniellejones', 5, 'Customer', 'MR_7JMp#c8', 'omoore@jones.com', '1970-11-01') ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES ('royjason', 6, 'Staff', '#UJdM1!g8s', 'kimberly40@brown-ford.com', '2000-08-26') ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES ('matthewgardner', 7, 'Staff', '$l9Rx$TDO1', 'jessicagray@campos.org', '1982-07-25') ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES ('simpsonjason', 8, 'Staff', '&T1G9w)5@O', 'anthony30@hotmail.com', '1960-05-25') ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES ('zacharyeaton', 9, 'Customer', '!_ZKX@gkU2', 'mskinner@hotmail.com', '1968-11-16') ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES ('derekcarrillo', 10, 'Staff', 'BDMh9OYv#j', 'singhmichael@wood-porter.com', '1986-07-16') ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES ('danny54', 11, 'Staff', 'x$Pi9ORqZC', 'bellwilliam@jones-moore.com', '2003-06-11') ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES ('heather57', 12, 'Staff', '&nmLzChqp3', 'oturner@gmail.com', '1960-06-15') ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES ('janetjacobs', 13, 'Staff', '!7RhFExD*r', 'njensen@marsh.com', '1971-02-24') ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES ('kristinajohnson', 14, 'Staff', '34DYsoaM$4', 'ogarza@hotmail.com', '2000-01-17') ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES ('nathan71', 15, 'Staff', '6yt^EuPp*c', 'andersenkayla@hotmail.com', '2000-10-21') ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES ('patriciamann', 16, 'Staff', '^ArNt@uWZ6', 'erica50@cabrera-perez.com', '1989-04-15') ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES ('cindywatson', 17, 'Staff', '7urmLOvw+4', 'jmarshall@bryant.com', '1989-09-24') ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES ('zcook', 18, 'Customer', '$KCaaUd#p4', 'ericmartinez@gmail.com', '1969-03-21') ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES ('meganjackson', 19, 'Customer', '@v6TCSp_Hu', 'fkim@hotmail.com', '1978-01-27') ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES ('johnmendoza', 20, 'Customer', '^n@h2Pm+#2', 'mdean@gmail.com', '1968-01-19') ON CONFLICT DO NOTHING;


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 221
-- Name: customer_customerid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customerid_seq', 1, false);


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 231
-- Name: ingredient_ingredientid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredient_ingredientid_seq', 1, false);


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 227
-- Name: menuitem_itemid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menuitem_itemid_seq', 1, false);


--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 234
-- Name: orders_orderid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_orderid_seq', 1, false);


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 225
-- Name: reservation_reservationid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_reservationid_seq', 1, false);


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 223
-- Name: restauranttable_tableid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restauranttable_tableid_seq', 1, false);


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 229
-- Name: review_reviewid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.review_reviewid_seq', 1, false);


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 219
-- Name: staff_staffid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_staffid_seq', 1, false);


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_userid_seq', 1, false);


-- Completed on 2024-12-06 11:23:24

--
-- PostgreSQL database dump complete
--

