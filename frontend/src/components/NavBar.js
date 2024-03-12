import { Box, Button, Card, CardBody, CardFooter, Container, Divider, Flex, HStack, Input, InputGroup, InputLeftElement, Spacer, Stack, StackDivider, Tag, VStack } from '@chakra-ui/react';
import { SearchIcon } from '@chakra-ui/icons';
import "./NavBar.css"
export default function NavBar(){
    return(
      <div id="navbar">
        <ul class="navigation">
          <li><a id="headbargov" href='/'>Instructions</a></li>
          <li>
            <InputGroup id="search">
              <InputLeftElement pointerEvents='none'>
                <SearchIcon color='gray.300' />
              </InputLeftElement>
              <Input placeholder='Search for DAOs' />
            </InputGroup>
          </li>
          <li><div id="spacing"></div></li>
          <li><a href='/nouns'>{localStorage.getItem("dao_name")} DAO</a></li>
          <li><a>Resources</a></li>
          <li><a>Media</a></li>
          <li><a>Developers</a></li>
          <li><Button colorScheme='black'>Connect Wallet</Button></li>
        </ul>
        <Divider id="divider"/>
      </div>
    );
  }