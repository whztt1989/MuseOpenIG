//#******************************************************************************
//#*
//#*      Copyright (C) 2015  Compro Computer Services
//#*      http://openig.compro.net
//#*
//#*      Source available at: https://github.com/CCSI-CSSI/MuseOpenIG
//#*
//#*      This software is released under the LGPL.
//#*
//#*   This software is free software; you can redistribute it and/or modify
//#*   it under the terms of the GNU Lesser General Public License as published
//#*   by the Free Software Foundation; either version 2.1 of the License, or
//#*   (at your option) any later version.
//#*
//#*   This software is distributed in the hope that it will be useful,
//#*   but WITHOUT ANY WARRANTY; without even the implied warranty of
//#*   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
//#*   the GNU Lesser General Public License for more details.
//#*
//#*   You should have received a copy of the GNU Lesser General Public License
//#*   along with this library; if not, write to the Free Software
//#*   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
//#*
//#*    Please direct any questions or comments to the OpenIG Forums
//#*    Email address: openig@compro.net
//#*
//#*
//#*****************************************************************************
//#*	author    Trajce Nikolov Nick openig@compro.net
//#*	copyright(c)Compro Computer Services, Inc.
//#*
//#*    Please direct any questions or comments to the OpenIG Forums
//#*    Email address: openig@compro.net
//#*

#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#if defined(OPENIG_SDK)
	#include <OpenIG-Networking/export.h>
	#include <OpenIG-Networking/network.h>
#else
	#include <Library-Networking/export.h>
	#include <Library-Networking/network.h>
#endif

#include <iostream>
#include <string>
#include <boost/array.hpp>
#include <boost/asio.hpp>

namespace OpenIG {
	namespace Library {
		namespace Networking {

			class IGLIBNETWORKING_EXPORT TCPClient : public Network
			{
			public:
				explicit TCPClient(const std::string& host, const std::string& server);
				virtual ~TCPClient();

				virtual void send(const Buffer&);
				virtual void receive(Buffer&, bool resetBuffer = true);

			protected:

				std::string						_server;
				boost::asio::io_service			_io_service;
				boost::asio::ip::tcp::socket*	_socket;
				bool							_setup_socket;
				std::string						_host;

				void createSocket();
				void setupSocket(boost::asio::ip::tcp::socket& socket);
				void handle(const boost::system::error_code& error, size_t bytes_transferred);
			};
		} // namespace
	} // namespace
} // namespace

#endif 
